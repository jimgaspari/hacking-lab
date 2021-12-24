terraform {
  required_providers {
    libvirt = {
      source = "dmacvicar/libvirt"
      version = "0.6.11"
    }
  }
}

provider "libvirt" {
    uri = var.kvm_uri
}

module "network" {
  source  = "jimgaspari/network/libvirt"
  version = "0.6.11"
  network_name = var.network_name
  network_mode = "none"
  network_domain = var.network_name
  network_addresses = ["192.168.110.0/24", "2001:db8:ca2:2::1/64"]
  dhcp_enabled = true
}
