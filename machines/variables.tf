variable "kvm_uri" {
  default = "qemu:///system"
}

variable "network_name" {
  default = "hacking"  
}

variable "disk_pool" {
  default = "default"
}

variable "goldeneye_base" {
  default = "/var/lib/libvirt/images/default/GoldenEye-v1.qcow2"
}

variable "msf1_base" {
  default = "/var/lib/libvirt/images/default/Metaspoitable1.qcow2"
}

variable "msf2_base" {
  default = "/var/lib/libvirt/images/default/Metasploitable2.qcow2"
}