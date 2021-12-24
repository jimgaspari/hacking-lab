terraform {
  required_providers {
    libvirt = {
      source = "dmacvicar/libvirt"
      version = "0.6.11"
    }
  }
}

resource "libvirt_volume" "disk" {
  name = var.disk_name
  pool = var.disk_pool
  base_volume_id = var.disk_base_id
}

resource "libvirt_domain" "domain" {
  provider = libvirt
  name = var.domain_name
  memory = var.domain_ram
  vcpu = var.domain_cpu
  
  network_interface {
    network_name = var.network_name
    wait_for_lease = true
  }

  disk {
    volume_id = libvirt_volume.disk.id
    scsi = var.use_scsi
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