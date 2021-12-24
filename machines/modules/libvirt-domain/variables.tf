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

variable "instances" {
    description = "Number of instances to create"
    type = number
    default = 1
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

variable "use_scsi" {
    description = "set the disk type to scsi"
    type = string
    default = "true"
}
variable "network_name" {
    description = "Network Interface name"
    type = string
    default = "default"
}