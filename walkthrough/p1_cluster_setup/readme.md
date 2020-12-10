# Cluster Setup - 10%

- [Cluster Setup](#cluster-setup)
  - [Section Outline](#section-outline)
  - [Questions](#questions)

## Section Outline

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
 

## Questions

1. Output the current Kubernetes cluster version to `~/cluster-version.txt`.
---
2. Verify that kube-apiserver is secure by copying its configuration to a `~/kube-apiserver.txt` file in this folder. Ensure the kube-apiserver configuration file is secure.
---
3. Verify that kube-scheduler is secure by copying its configuration to a `~/kube-scheduler.txt` file in this folder. 
---
4. Verify that kube-controller-manager is secure by copying its configuration to a `~/kube-controller-manager.txt` file in this folder. kube-controller-manager. 
---
5. Remove any unnecessary services in the `kube-system` namespace.
---
6. Create a ingress policy called `hello-ingress` for the `hello-world` deployment using the created **hello-world service**. Use `host: hello-world.info` and `pathType: Prefix` in the ingress configuration.
---
7. Add an ingress class named `nginx` to the `hello-ingress` resource that was just created in question 6. Make sure it is part of the default class.
---
8. Using a NetworkPolicy called `default-deny`, block all network access to the `nginx-ingress` namespace.
---
9. Create a NetworkPolicy for ingress traffic to the `hello-world` deployment from the `ingress-nginx-controller`.  


