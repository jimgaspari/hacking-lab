resource "libvirt_volume" "kali-disk" {
  name = "kali-2021.qcow2"
  pool = "BahamutDisks"
  source = "../kali-vm/images/kali.qcow2"
}


data "template_file" "user_data" {
  template = file("${path.module}/cloud-init/cloud_init.yml")
}

data "template_file" "network_config" {
  template = file("${path.module}/cloud-init/kali_network_config.yml")
}

resource "libvirt_cloudinit_disk" "kaliinit" {
  name           = "kali_init.iso"
  user_data      = data.template_file.user_data.rendered
  network_config = data.template_file.network_config.rendered
  pool           = "BahamutISO"
}

resource "libvirt_domain" "domain-kali" {
  provider = libvirt
  name = "kali"
  memory = 1024
  vcpu = 1
  qemu_agent = true
  
  cloudinit = libvirt_cloudinit_disk.kaliinit.id

  network_interface {
    network_name = "macvtap-net"
    mac = "52:54:00:8f:fe:dd"
  }

  network_interface {
    network_name = "hacking"
    wait_for_lease = true
  }

  disk {
    volume_id = libvirt_volume.kali-disk.id
    scsi = "true"
  }

  console {
    type        = "pty"
    target_port = "0"
    target_type = "serial"
  }

  graphics {
    type = "spice"
    listen_type = "address"
    autoport = true
  }
  
}

output "Kali_IPs" {
  value = libvirt_domain.domain-kali.network_interface.*.addresses
}