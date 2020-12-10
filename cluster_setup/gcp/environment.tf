resource "tls_private_key" "info" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

locals {
  ssh_auth_key    = file("${path.module}/files/id_rsa.pub")
  ssh_public_key  = replace(tls_private_key.info.public_key_pem, "\n", "")
  ssh_private_key = replace(tls_private_key.info.private_key_pem, "\n", "")
  description     = "your public key to ssh into the created VM's"
}

data "template_file" "setup" {
  template = templatefile("${path.module}/files/init.sh", { username = var.user, ssh_auth_key = local.ssh_auth_key, ssh_public_key = local.ssh_public_key, ssh_private_key = local.ssh_private_key })
}

data "template_file" "config" {
  depends_on = [google_compute_instance.worker_node]
  template   = templatefile("${path.module}/files/cluster.yml", { username = var.user , control-plane = google_compute_instance.cp_node.network_interface.0.access_config.0.nat_ip, worker-0 = google_compute_instance.worker_node.0.network_interface.0.access_config.0.nat_ip, worker-1 = google_compute_instance.worker_node.1.network_interface.0.access_config.0.nat_ip })
}
