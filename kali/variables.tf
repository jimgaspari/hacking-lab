variable "kvm_uri" {
  default = "qemu:///system"
}

variable "network_name" {
  default = "hacking"  
}

variable "disk_pool" {
  default = "default"
}

variable "kali_base" {
  default = "/var/lib/libvirt/images/default/kali.raw"
}