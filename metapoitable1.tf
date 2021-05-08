resource "libvirt_volume" "msf1-disk" {
  name = "msf1.qcow2"
  pool = "BahamutDisks"
  base_volume_id = "msf1/Metaspoitable1.qcow2"
}

resource "libvirt_domain" "domain-msf1" {
  provider = libvirt
  name = "Metaspoitable1"
  memory = 512
  vcpu = 2
  
  network_interface {
    network_name = "hacking"
    wait_for_lease = true
  }

  disk {
    volume_id = libvirt_volume.msf1-disk.id
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

output "Metaspoitable1_IP" {
  value = libvirt_domain.domain-msf1.*.network_interface.0.addresses
}