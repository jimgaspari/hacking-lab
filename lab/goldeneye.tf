resource "libvirt_volume" "goldeneye-disk" {
  name = "goldeneye.qcow2"
  pool = "BahamutDisks"
  source = "../geye/GoldenEye-v1.qcow2"
}

resource "libvirt_domain" "domain-goldeneye" {
  provider = libvirt
  name = "goldeneye"
  memory = 1024
  vcpu = 1
  
  network_interface {
        network_name = "hacking"
        wait_for_lease = true
  }

  disk {
    volume_id = libvirt_volume.goldeneye-disk.id
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

output "GoldenEye_IP" {
  value = libvirt_domain.domain-goldeneye.*.network_interface.0.addresses
}