resource "libvirt_network" "hacking" {
  name = "hacking"
  mode = "none"
  domain = ""

  #  list of subnets the addresses allowed for domains connected
  # also derived to define the host addresses
  # also derived to define the addresses served by the DHCP server
  addresses = ["192.168.110.0/24", "2001:db8:ca2:2::1/64"]
  dhcp {
   enabled = true 
  }  
}