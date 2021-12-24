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

module "Kali" {
  source  = "./modules/kali"
  disk_name = "kali"
  disk_pool = var.disk_pool
  disk_base_id = var.kali_base
  domain_name = "kali"
  domain_ram = 4098
  domain_cpu = 2
  external_interface = "enp4s0"
  external_ipaddr = [ "192.168.0.16" ]
  network_name = var.network_name
}