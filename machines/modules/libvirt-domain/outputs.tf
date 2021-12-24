output "Instance_IP" {
  value = "${flatten(libvirt_domain.domain.*.network_interface.0.addresses)}"
}