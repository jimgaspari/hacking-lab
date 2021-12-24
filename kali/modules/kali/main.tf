terraform {
  required_providers {
    libvirt = {
      source = "dmacvicar/libvirt"
      version = "0.6.11"
    }
  }
}

resource "libvirt_volume" "kali-disk" {
  name = var.disk_name
  pool = var.disk_pool
  base_volume_id = var.disk_base_id
  size = var.disk_size
}

resource "libvirt_domain" "domain-kali" {
  provider = libvirt
  name = var.domain_name
  memory = var.domain_ram
  vcpu = var.domain_cpu
  cloudinit = libvirt_cloudinit_disk.commoninit.id
  
  network_interface {
    macvtap = var.external_interface
    addresses = var.external_ipaddr
    mac = "52:54:00:8F:FE:DD"
  }

  network_interface {
    network_name = var.network_name
    wait_for_lease = true
  }

  disk {
    volume_id = libvirt_volume.kali-disk.id
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