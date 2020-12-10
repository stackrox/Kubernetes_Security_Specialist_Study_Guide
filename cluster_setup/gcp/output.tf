# Output variables

# Private IP addresses
output "private" {
  value = google_compute_instance.cp_node.*.network_interface.0.network_ip
}

# Private IP addresses
output "private-worker" {
  value = google_compute_instance.worker_node.*.network_interface.0.network_ip
}

# Public IP addresses
output "public" {
  value = google_compute_instance.cp_node.*.network_interface.0.access_config.0.nat_ip
}

# Public IP addresses
output "public-worker" {
  value = google_compute_instance.worker_node.*.network_interface.0.access_config.0.nat_ip
}
