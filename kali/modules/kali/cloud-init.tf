resource "libvirt_cloudinit_disk" "commoninit" {
  name      = "kaliinit.iso"
  user_data = data.template_file.user_data.rendered
  pool = var.disk_pool
}

data "template_file" "user_data" {
  template = file("cloud_init.cfg")
}