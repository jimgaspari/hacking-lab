output "Instance_IP" {
  value = "${flatten(libvirt_domain.domain-kali.network_interface.*.addresses)}"
}