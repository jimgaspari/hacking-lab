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

module "geye" {
  source = "./modules/libvirt-domain"
  disk_name = "goldeneye"
  disk_pool = var.disk_pool
  disk_base_id = var.goldeneye_base
  domain_name = "goldeneye"
  domain_ram = 512
  domain_cpu = 1
  network_name = var.network_name
}

module "MSF1" {
  source = "./modules/libvirt-domain"
  disk_name = "msf1.qcow"
  disk_pool = var.disk_pool
  disk_base_id = var.msf1_base
  domain_name = "msf1"
  domain_ram = 512
  domain_cpu = 1
  use_scsi = "false"
  network_name = var.network_name
}

module "MSF2" {
  source = "./modules/libvirt-domain"
  disk_name = "msf2.qcow"
  disk_pool = var.disk_pool
  disk_base_id = var.msf2_base
  domain_name = "msf2"
  domain_ram = 512
  domain_cpu = 1
  use_scsi = "false"
  network_name = var.network_name
}