#####################
# general variables #
#####################

variable "project_id" {
  default     = "main-project-290402"
  description = "the Google project ID"
}

variable "region" {
  default     = "us-east1"
  description = "The default region for the GKE cluster"
}

variable "zone" {
  default     = "us-east1-c"
  description = "The default zone. Must be a zone located in the specified region above"
}

variable "user" {
  default     = "michaelfoster"
  description = "your gcp username"
}

#####################
# cluster variables #
#####################

variable "k8version" {
  default = "rancher/hyperkube:v1.19.3-rancher1"
}

variable "num_nodes" {
  default     = 2
  description = "the default number of WORKER NODES in the cluster"
}

variable "node_type" {
  default     = "e2-standard-2"
  description = "the default node type"
}

variable "node_disk" {
  default     = 25
  description = "the default node disksize (in GB)"
}

variable "node_os" {
  default     = "ubuntu-minimal-2004-lts"
  description = "the default image os. Ubuntu is used in CNCF certifications"
}