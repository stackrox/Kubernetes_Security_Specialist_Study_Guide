
resource "google_compute_firewall" "default" {
  name     = "tf-k8s-firewall"
  network  = "default"
  priority = "1000"

  allow {
    protocol = "tcp"
    ports    = ["22", "80", "443", "2376", "2379", "2380", "5000", "6443", "8080", "9099", "10250", "10254", "30000-32767"]
  }
  allow {
    protocol = "udp"
    ports    = ["500", "2379", "4500", "6443", "8080", "8472", "9099", "30000-32767"]
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["k8s-node"]
}


## below are the default google firewall rules

#resource "google_compute_firewall" "default-allow-internal" {
#  name    = "default-allow-internal"
#  network = "default"
#  priority = "65534"
#
#  allow {
#    protocol = "tcp"
#    ports    = ["0-65535"]
#  }
#  allow {
#  	protocol = "udp"
#  	ports    = ["0-65535"]
#  }
#
#  allow {
#    protocol = "icmp"
#  }
#
#  source_ranges = ["10.128.0.0/9"]
#
#}
#
#resource "google_compute_firewall" "default-allow-ssh" {
#  name    = "default-allow-ssh"
#  network = "default"
#  priority = "65534"
#
#  allow {
#    protocol = "tcp"
#    ports    = ["22"]
#  }
#
#  source_ranges = ["0.0.0.0/0"]
#}
#
#resource "google_compute_firewall" "default-allow-rdp" {
#  name    = "default-allow-rdp"
#  network = "default"
#  priority = "65534"
#
#  allow {
#    protocol = "tcp"
#    ports    = ["3389"]
#  }
#
#  source_ranges = ["0.0.0.0/0"]
#
#}
#
#resource "google_compute_firewall" "default-allow-icmp" {
#  name    = "default-allow-icmp"
#  network = "default"
#  priority = "65534"
#
#  allow {
#    protocol = "icmp"
#  }
#
#  source_ranges = ["0.0.0.0/0"]
#
#}
