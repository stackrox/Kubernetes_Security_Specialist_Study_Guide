# ------------ GCP Cluster Filepaths ----------------#
env_path_gcp=gcp/state
env_path_gcp_cluster=gcp/cluster

# ------------ Azure Cluster Filepaths ----------------#
env_path_az=az/state
env_path_az_cluster=az/cluster

# ------------ AWS Cluster Filepaths ----------------#
env_path_aws=aws/state
env_path_aws_cluster=aws/cluster

# ------------ AWS Cluster Creation Commands----------------#

.PHONY: aws-init
aws-init: log-aws-init
	@terraform init aws/

.PHONY: aws-validate
aws-validate: aws-init aws-validate 
	@terraform validate aws/ && echo "OK"

.PHONY: aws-plan
aws-plan: log-aws-plan 
	@terraform plan -state $(env_path_aws)/terraform.tfstate -out $(env_path_aws)/terraform.tfplan aws/ 

.PHONY: aws-apply
aws-apply: log-aws-apply aws-plan
	@terraform apply -state-out $(env_path_aws)/terraform.tfstate $(env_path_aws)/terraform.tfplan

.PHONY: aws-rke-up
aws-rke-up: log-aws-rke-up
	@rke up --config $(env_path_aws_cluster)/cluster.yml

.PHONY: aws-rke-remove
aws-rke-remove: log-aws-rke-remove
	@rke remove --config $(env_path_aws_cluster)/cluster.yml

.PHONY: aws-destroy
aws-destroy: log-aws-destroy aws/ 
		@terraform destroy -state $(env_path_aws)/terraform.tfstate

# ------------ GCP Cluster Creation Commands----------------#

.PHONY: gcp-init
gcp-init: log-gcp-init
	@terraform init gcp/

.PHONY: gcp-validate
gcp-validate: gcp-init gcp-validate 
	@terraform validate gcp/ && echo "OK"

.PHONY: gcp-plan
gcp-plan: log-gcp-plan 
	@terraform plan -state $(env_path_gcp)/terraform.tfstate -out $(env_path_gcp)/terraform.tfplan gcp/ 

.PHONY: gcp-apply
gcp-apply: log-gcp-apply gcp-plan
	@terraform apply -state-out $(env_path_gcp)/terraform.tfstate $(env_path_gcp)/terraform.tfplan

.PHONY: gcp-rke-up
gcp-rke-up: log-gcp-rke-up
	@rke up --config $(env_path_gcp_cluster)/cluster.yml

.PHONY: gcp-rke-remove
gcp-rke-remove: log-gcp-rke-remove
	@rke remove --config $(env_path_gcp_cluster)/cluster.yml

.PHONY: gcp-destroy
gcp-destroy: log-gcp-destroy gcp/ 
		@terraform destroy -state $(env_path_gcp)/terraform.tfstate

#=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=
.PHONY: help
help:
	@grep -h -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "$(BLUE_COLOR)%-20s$(NO_COLOR) %s\n", $$1, $$2}'

.PHONY: checkfmt
checkfmt: log-checkfmt ## Check configs format
	@terraform fmt -recursive -check=true && echo "OK"

log-%:
	@grep -h -E '^$*:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "$(BLUE_COLOR)==> %s$(NO_COLOR)\n", $$2}'
