resource "libvirt_volume" "msf2-disk" {
  name = "msf2.qcow2"
  pool = "BahamutDisks"
  source = "../msf2/Metasploitable2.qcow2"
}

resource "libvirt_domain" "domain-msf2" {
  provider = libvirt
  name = "Metaspoitable2"
  memory = 1024
  vcpu = 2
  
  network_interface {
    network_name = "hacking"
    # wait_for_lease = true
  }

  disk {
    volume_id = libvirt_volume.msf2-disk.id
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

output "Metaspoitable2_IP" {
  value = libvirt_domain.domain-msf2.*.network_interface.0.addresses
}