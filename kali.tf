resource "libvirt_volume" "kali-disk" {
  name = "kali-test.qcow2"
  pool = "BahamutDisks"
  source = "kali-vm/images/tdhtest"
}

resource "libvirt_domain" "domain-kali" {
  provider = libvirt
  name = "kali-test"
  memory = 1024
  vcpu = 1
  qemu_agent = true
  
  network_interface {
    macvtap = "enp4s0"
    addresses = [ "192.168.0.17" ]
    mac = "52:54:00:8f:fe:dd"
  }

  network_interface {
    network_name = "hacking"
    addresses = [ "192.168.110.17" ]
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
  value = libvirt_domain.domain-kali.*.network_interface.0.addresses
}