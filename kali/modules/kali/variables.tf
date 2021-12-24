variable "disk_name" {
    description = "Name of the Libvirt Disk"
    type = string
    default = "disk1"
}

variable "disk_pool" {
    description = "Name of the Libvirt Volume Pool"
    type = string
    default = "default"
}

variable "disk_base_id" {
    description = "Name of the Libvirt Base Volume ID"
    type = string
    default = "default"
}

variable "disk_size" {
    description = "Size of the disk to expand the base image"
    type = string
    default = "53687091200"
}

variable "domain_name" {
    description = "Name of the Libvirt Domain"
    type = string
    default = "domain1"
}

variable "domain_ram" {
    description = "Amount of ram for the domain"
    type = number
    default = 256
}

variable "domain_cpu" {
    description = "Number of CPU cores for the domain"
    type = number
    default = 1
}

variable "external_interface" {
    description = "External interface to attach to kali image"
    type = string
    default = "eth0"
}

variable "external_ipaddr" {
    description = "External IP interface to provide to kali image"
    type = list
    default = [ "192.168.0.100" ]
}
variable "network_name" {
    description = "Network Interface name"
    type = string
    default = "default"
}