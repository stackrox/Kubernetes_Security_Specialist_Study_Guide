# Terraform resources 

# Create cluster nodes required
resource "google_compute_instance" "cp_node" {
  name         = "rke-cks-control-plane"
  machine_type = var.node_type

  boot_disk {
    initialize_params {
      image = var.node_os
      size  = var.node_disk
    }
  }

  metadata_startup_script = data.template_file.setup.rendered
  tags = ["k8s-node"]

  network_interface {
    network = "default"
    access_config {
    }
  }
}

# Create cluster nodes required
resource "google_compute_instance" "worker_node" {
  name         = "rke-cks-worker-${count.index}"
  machine_type = var.node_type
  count        = var.num_nodes

  boot_disk {
    initialize_params {
      image = var.node_os
      size  = var.node_disk
    }
  }
  
  metadata_startup_script = data.template_file.setup.rendered
  tags = ["k8s-node"]

  network_interface {
    network = "default"
    access_config {
    }
  }
}

resource "null_resource" "wait" {
  depends_on = [google_compute_instance.worker_node]
  provisioner "local-exec" {
    command = "sleep 30s"
  }
}

resource "local_file" "cluster" {
  filename = "${path.module}/cluster/cluster.yml"
  content  = data.template_file.config.rendered
}