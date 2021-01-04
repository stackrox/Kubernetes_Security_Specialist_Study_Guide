# Certified Kubernetes Security Specialist Study Guide 

<p align="center">
  <img width="360" src="img/kcss_logo.png">
</p>

- [Certified Kubernetes Security Specialist Study Guide](#certified-kubernetes-security-specialist-study-guide)
  - [CKS Overview](#cks-overview)
    - [Repository Structure](#repository-structure)
    - [Outline](#outline)
    - [Exam News and Overview](#exam-news-and-overview)
    - [KubeCon Announcement and Preparation Tips](#kubecon-announcement-and-preparation-tips)
  - [Curriculum](#curriculum)
    - [Cluster Setup - 10%](#cluster-setup---10)
    - [Cluster Hardening - 15%](#cluster-hardening---15)
    - [System Hardening - 15%](#system-hardening---15)
    - [Minimize Microservice Vulnerabilities - 20%](#minimize-microservice-vulnerabilities---20)
    - [Supply Chain Security - 20%](#supply-chain-security---20)
    - [Monitoring, Logging and Runtime Security - 20%](#monitoring-logging-and-runtime-security---20)
  - [Extra Resources](#extra-resources)

## CKS Overview  

The CKS is the third Kubernetes based certification backed by the Cloud Native Computing Foundation (CNCF). CKS will join the existing [Certified Kubernetes Administrator (CKA)](https://www.cncf.io/certification/cka/) and [Certified Kubernetes Application Developer (CKAD)](https://www.cncf.io/certification/ckad/) programs. All three certifications are online, proctored, performance-based exams that will require solving multiple Kubernetes security tasks from the command line. With the massive investment into Kubernetes over the last five years, these certifications continue to be highly sought after by many seeking out technical knowledge about Kubernetes.

This repository contains resources to build a Kubernetes cluster, and example questions and answers based on the [Certified Kubernetes Security Specialist (CKS) exam curriculum](https://github.com/cncf/curriculum/blob/master/CKS_Curriculum_%20v1.19%20Coming%20Soon%20November%202020.pdf).

### Repository Structure

```shell
study_guide/
└ cluster_setup/
  └ Makefile
  └ gcp   -> Create a 1.19 cluster in GCP with RKE.
  └ aws   (coming soon)
  └ azure (coming soon)
└ img/
  └ all_images_used
└ walkthrough/
  └ p0_intro/
  └ p1_cluster_setup /
  └ p2_cluster_hardening/
  └ p3_system_hardening/
  └ p4_minimizing_vulnerabilities/
  └ p5_supply_chain_security/
  └ p6_monitoring_logging_runtime_security/
└ LICENSE
└ README.md
```

### Outline

The CKS test will be online, proctored and performance-based, and candidates have 2 hours to complete the exam tasks. This information is currently based on the [Linux Foundations release of the CKS outline](https://training.linuxfoundation.org/certification/certified-kubernetes-security-specialist/).

From the CKS Exam Curriculum repository, The exam will test domains and competencies including:
- [Cluster Setup (10%)](#cluster-setup---10): Best practice configuration to control the environment's access, rights and platform conformity.
- [Cluster Hardening (15%)](#cluster-hardening---15): Protecting K8s API and utilize RBAC.
- [System Hardening (15%)](#system-hardening---15): Improve the security of OS & Network; restrict access through IAM.
- [Minimize Microservice Vulnerabilities (20%)](#minimize-microservice-vulnerabilities---20): Utilizing on K8s various mechanisms to isolate, protect and control workload.
- [Supply Chain Security (20%)](#supply-chain-security---20): Container oriented security, trusted resources, optimized container images, CVE scanning.
- [Monitoring, Logging, and Runtime Security (20%)](#monitoring-logging-and-runtime-security---20): Analyse and detect threads.

### Exam News and Overview

-> [CNCF CKS Overview](https://www.stackrox.com/post/2020/11/what-is-cncf-certified-kubernetes-security-specialist-cks-exam-and-what-is-covered/)

### KubeCon Announcement and Preparation Tips

-> [KubeCon Announcement and Linux Foundation Update](https://www.stackrox.com/post/2020/11/cks-cncf-announcement-and-exam-study-tips/)

## Curriculum

Below is the CKS curriculum broken down by its six sections. Each section has its own folder in the repository, where you can walk through individual questions relating to their respective topic. Each section in the curriculum overview also contains external resources that you may find useful in your studying journey,

### Cluster Setup - 10% 

<details><summary>Use CIS benchmark to review the security configuration of Kubernetes components (etcd, kubelet, kubedns, kubeapi)</summary>

* [CIS benchmark for Kubernetes](https://www.cisecurity.org/benchmark/kubernetes/)

</summary>
</details>

<details><summary>Verify platform binaries before deploying</summary>
  
* [Kubernetes platform binaries](https://github.com/kubernetes/kubernetes/releases)
</details>

<details><summary>Protect node metadata and endpoints</summary>
  
* [Setting up secure endpoints in Kubernetes](https://blog.cloud66.com/setting-up-secure-endpoints-in-kubernetes/)

</details>

<details><summary>Use Network security policies to restrict cluster level access</summary>
  
* [Network Policies](https://kubernetes.io/docs/concepts/services-networking/network-policies)
* [An Introduction to Network Policies](https://medium.com/@reuvenharrison/an-introduction-to-kubernetes-network-policies-for-security-people-ba92dd4c809d)
* [Get started with Kubernetes network policy](https://docs.projectcalico.org/security/kubernetes-network-policy)
</details>

<details><summary>Properly set up Ingress objects with security control</summary>
  
* [Ingress](https://kubernetes.io/docs/concepts/services-networking/ingress/)

</details>

<details><summary>Minimize use of, and access to, GUI elements</summary>
  
* [On Securing the Kubernetes Dashboard](https://blog.heptio.com/on-securing-the-kubernetes-dashboard-16b09b1b7aca)
  
</details>

### Cluster Hardening - 15%

<details><summary>Restrict access to Kubernetes API</summary>

* [Controlling Access to the Kubernetes API](https://kubernetes.io/docs/reference/access-authn-authz/controlling-access/)

</details>

<details><summary>Use Role Based Access Controls to minimize exposure</summary>

* [Using RBAC Authorization](https://kubernetes.io/docs/reference/access-authn-authz/rbac/)

</details>

<details><summary>Exercise caution in using service accounts e.g. disable defaults, minimize permissions on newly created ones</summary>
  
* [Managing Service Accounts](https://kubernetes.io/docs/reference/access-authn-authz/service-accounts-admin/)
* [Configure Service Accounts for Pods](https://kubernetes.io/docs/tasks/configure-pod-container/configure-service-account/)
* [Securing Kubernetes Clusters by Eliminating Risky Permissions](https://www.cyberark.com/resources/threat-research-blog/securing-kubernetes-clusters-by-eliminating-risky-permissions)

</details>

### System Hardening - 15%
<details><summary>Minimize host OS footprint (reduce attack surface)</summary>

* [Reduce Kubernetes Attack Surfaces](https://blog.sonatype.com/kubesecops-kubernetes-security-practices-you-should-follow#:~:text=Reduce%20Kubernetes%20Attack%20Surfaces)
* [CIS Benchmark Ubuntu Linux](https://www.cisecurity.org/benchmark/ubuntu_linux/)

</details>

<details><summary>Minimize IAM roles</summary>

* [IAM Grant least privilege](https://docs.aws.amazon.com/IAM/latest/UserGuide/best-practices.html#grant-least-privilege)

</details>

<details><summary>Minimize external access to the network</summary>

* [Secure hosts with OS-level firewall (ufw)](https://help.replicated.com/community/t/managing-firewalls-with-ufw-on-kubernetes/230)

</details>

<details><summary>Appropriately use kernel hardening tools such as AppArmor, seccomp</summary>

* [Kubernetes Hardening Best Practices](https://www.sumologic.com/kubernetes/security/#security-best-practices)

</details>

### Minimize Microservice Vulnerabilities - 20%
<details><summary>Setup appropriate OS level security domains e.g. using PSP, OPA, security contexts</summary>

* [Pod Security Policies](https://kubernetes.io/docs/concepts/policy/pod-security-policy/)
* [Configure a Security Context for a Pod or Container](https://kubernetes.io/docs/tasks/configure-pod-container/security-context/)
* [Pod Security Policy](https://blog.alcide.io/pod-security-policy)

</details>

<details><summary>Manage Kubernetes secrets</summary>

* [Kubernetes Secrets](https://kubernetes.io/docs/concepts/configuration/secret/)

</details>

<details><summary>Use container runtime sandboxes in multi-tenant environments (e.g. gvisor, kata containers)</summary>

</details>

<details><summary>Implement pod to pod encryption by use of mTLS</summary>
  
* [Manage TLS Certificates in a Cluster](https://kubernetes.io/docs/tasks/tls/managing-tls-in-a-cluster/)

</details>

### Supply Chain Security - 20%

<details><summary>Minimize base image footprint</summary>

* [Why build small container images in Kubernetes](https://cloud.google.com/blog/products/gcp/kubernetes-best-practices-how-and-why-to-build-small-container-images)
* [7 best practices for building containers](https://cloud.google.com/blog/products/gcp/7-best-practices-for-building-containers)

</details>

<details><summary>Secure your supply chain: whitelist allowed image registries, sign and validate images</summary>

* [Using Admission Controllers](https://kubernetes.io/docs/reference/access-authn-authz/admission-controllers/)
* [Dynamic Admission Control](https://kubernetes.io/docs/reference/access-authn-authz/extensible-admission-controllers/)
* [How to reject docker registries in Kubernetes?](https://stackoverflow.com/questions/54463125/how-to-reject-docker-registries-in-kubernetes)
* [Container image signatures in Kubernetes](https://medium.com/sse-blog/container-image-signatures-in-kubernetes-19264ac5d8ce)

</details>

<details><summary>Use static analysis of user workloads (e.g. kubernetes resources, docker files)</summary>

</details>

<details><summary>Scan images for known vulnerabilities</summary>

* [Scan your Docker images for vulnerabilities](https://medium.com/better-programming/scan-your-docker-images-for-vulnerabilities-81d37ae32cb3)

</details>

### Monitoring, Logging and Runtime Security - 20%

<details><summary>Perform behavioral analytics of syscall process and file activities at the host and container level to detect malicious activities</summary>

* [Restrict a Container's Syscalls with Seccomp](https://kubernetes.io/docs/tutorials/clusters/seccomp/)

</details>

<details><summary>Detect threats within physical infrastructure, apps, networks, data, users and workloads</summary>
  
* [Threat matrix for Kubernetes](https://www.microsoft.com/security/blog/2020/04/02/attack-matrix-kubernetes/)

</details>

<details><summary>Detect all phases of attack regardless where it occurs and how it spreads</summary>

* [Investigating Kubernetes attack scenarios in Threat Stack](https://www.threatstack.com/blog/kubernetes-attack-scenarios-part-1)

</details>

<details><summary>Perform deep analytical investigation and identification of bad actors within environment</summary>

* [Kubernetes security 101: Risks and Best practices](https://www.stackrox.com/post/2020/05/kubernetes-security-101/)
  
</details>

<details><summary>Ensure immutability of containers at runtime</summary>

* [Leverage Kubernetes to ensure that containers are immutable](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux_atomic_host/7/html/container_security_guide/keeping_containers_fresh_and_updateable#leveraging_kubernetes_and_openshift_to_ensure_that_containers_are_immutable)

</details>

<details><summary>Use Audit Logs to monitor access</summary>

* [Kubernetes Audit](https://kubernetes.io/docs/tasks/debug-application-cluster/audit/)
* [How to monitor Kubernetes audit logs?](https://www.datadoghq.com/blog/monitor-kubernetes-audit-logs/)

</details>

## Extra Resources

- [Linux Academy: CKA Training](https://training.linuxfoundation.org/certification/certified-kubernetes-administrator-cka/)
- [A Cloud Guru: CKAD Training](https://acloudguru.com/course/certified-kubernetes-application-developer-ckad)
- [A Cloud Guru: Kubernetes Security](https://acloudguru.com/course/kubernetes-security)
- [GitHub: walidshaari - CKSS](https://github.com/walidshaari/Certified-Kubernetes-Security-Specialist)
- [GitHub: Madhu Akula's Kubernetes Goat](https://github.com/madhuakula/kubernetes-goat)
- [GitHub: Abdennour](https://github.com/abdennour/certified-kubernetes-security-specialist)
