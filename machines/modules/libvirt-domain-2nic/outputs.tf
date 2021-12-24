output "Instance_IP" {
  value = libvirt_domain.domain.*.network_interface.0.addresses
}