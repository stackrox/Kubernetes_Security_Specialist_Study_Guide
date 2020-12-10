# Answers

## 1. Output the current Kubernetes cluster version to `~/cluster-version.txt`.

We always want to make sure that we are keeping our Kubernetes clusters up-to-date to take full advantage of the Kubernetes Community and avoid exploits. A simple kubectl version command will do the trick.

```shell
kubectl version > cluster-version.txt
...
Client Version: version.Info{Major:"1", Minor:"19", GitVersion:"v1.19.2", GitCommit:"f5743093fd1c663cb0cbc89748f730662345d44d", GitTreeState:"clean", BuildDate:"2020-09-16T21:51:49Z", GoVersion:"go1.15.2", Compiler:"gc", Platform:"darwin/amd64"}
Server Version: version.Info{Major:"1", Minor:"19", GitVersion:"v1.19.3", GitCommit:"1e11e4a2108024935ecfcb2912226cedeafd99df", GitTreeState:"clean", BuildDate:"2020-10-14T12:41:49Z", GoVersion:"go1.15.2", Compiler:"gc", Platform:"linux/amd64"}
```

## 2. Verify that kube-apiserver is secure by copying its configuration to a `~/kube-apiserver.txt` file in this folder. Ensure the kube-apiserver configuration file is secure.

The next three questions revolve around verification of the status of the Kubernetes components. Verifying the components require using ssh to gain access into the control plane and worker nodes, then using `ps -ef` to view the process details.

```shell
kubectl get nodes
...
NAME             STATUS   ROLES               AGE    VERSION
34.74.36.229     Ready    worker              149m   v1.19.3
34.75.30.50      Ready    controlplane,etcd   149m   v1.19.3
35.227.125.102   Ready    worker              149m   v1.19.3
```

```shell
ssh 34.75.30.50
ps -ef | grep kube-apiserver
...
  root       PID   PPID  C STIME TTY        TIME kube-apiserver \
  --secure-port=6443 \
  --audit-log-maxbackup=10 \
  --audit-log-maxsize=100 \
  --etcd-certfile=/etc/kubernetes/ssl/kube-node.pem \
  --proxy-client-key-file=/etc/kubernetes/ssl/kube-apiserver-proxy-client-key.pem \
  --service-account-key-file=/etc/kubernetes/ssl/kube-service-account-token-key.pem \
  --tls-cert-file=/etc/kubernetes/ssl/kube-apiserver.pem \
  --enable-admission-plugins=NamespaceLifecycle,LimitRanger,ServiceAccount,DefaultStorageClass,DefaultTolerationSeconds,MutatingAdmissionWebhook,ValidatingAdmissionWebhook,ResourceQuota,NodeRestriction,Priority,TaintNodesByCondition,PersistentVolumeClaimResize,PodSecurityPolicy \
  --audit-policy-file=/etc/kubernetes/audit-policy.yaml \
  --tls-cipher-suites=TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256,TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384,TLS_ECDHE_ECDSA_WITH_CHACHA20_POLY1305,TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256,TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384,TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305 \
  --cloud-provider= \
  --service-cluster-ip-range=10.43.0.0/16 \
  --service-node-port-range=30000-32767 \
  --requestheader-group-headers=X-Remote-Group \
  --requestheader-username-headers=X-Remote-User \
  --etcd-cafile=/etc/kubernetes/ssl/kube-ca.pem \
  --kubelet-preferred-address-types=InternalIP,ExternalIP,Hostname \
  --audit-log-path=/var/log/kube-audit/audit-log.json \
  --etcd-servers=https://34.75.30.50:2379 \
  --bind-address=0.0.0.0 \
  --storage-backend=etcd3 \
  --advertise-address=34.75.30.50 \
  --client-ca-file=/etc/kubernetes/ssl/kube-ca.pem \
  --etcd-prefix=/registry \
  --insecure-port=0 \
  --profiling=false \
  --audit-log-format=json \
  --anonymous-auth=false \
  --kubelet-client-certificate=/etc/kubernetes/ssl/kube-apiserver.pem \
  --proxy-client-cert-file=/etc/kubernetes/ssl/kube-apiserver-proxy-client.pem \
  --requestheader-client-ca-file=/etc/kubernetes/ssl/kube-apiserver-requestheader-ca.pem \
  --tls-private-key-file=/etc/kubernetes/ssl/kube-apiserver-key.pem \
  --service-account-lookup=true \
  --requestheader-allowed-names=kube-apiserver-proxy-client \
  --authorization-mode=Node,RBAC \
  --audit-log-maxage=30 \
  --etcd-keyfile=/etc/kubernetes/ssl/kube-node-key.pem \
  --kubelet-client-key=/etc/kubernetes/ssl/kube-apiserver-key.pem \
  --requestheader-extra-headers-prefix=X-Remote-Extra- \
  --runtime-config=policy/v1beta1/podsecuritypolicy=true \
  --allow-privileged=true user+  111875  111863  0 22:47 pts/0    00:00:00 grep \
  --color=auto kube-apiserver
```

We can check the configuration for any [misconfigurations in the apiserver](https://www.stackrox.com/post/2019/09/12-kubernetes-configuration-best-practices/). We can also check the permissions on the configuration files to verify that only the root user has access. With a default install of Kubernetes, the manifest files are found in the `/etc/kubernetes/manifests` directory. 

## 3. Verify that kube-scheduler is secure by copying its configuration to a `~/kube-scheduler.txt` file in this folder. 

We can repeat the same `ps -ef` command for the kube-scheduler.

```shell
ps -ef | grep kube-scheduler
...
kube-scheduler \
  --kubeconfig=/etc/kubernetes/ssl/kubecfg-kube-scheduler.yaml \
  --address=0.0.0.0 \
  --leader-elect=true \
  --profiling=false \
  --v=2
```

## 4. Verify that kube-controller-manager is secure by copying its configuration to a `~/kube-controller-manager.txt` file in this folder. kube-controller-manager. 

We can repeat the same `ps -ef` command for the kube-controller-manager.

```shell
ps -ef | grep kube-controller-manager
...
10.43.0.0/16 \
  --service-account-private-key-file=/etc/kubernetes/ssl/kube-service-account-token-key.pem \
  --configure-cloud-routes=false \
  --v=2 \
  --cluster-cidr=10.42.0.0/16 \
  --enable-hostpath-provisioner=false \
  --cloud-provider= \
  --root-ca-file=/etc/kubernetes/ssl/kube-ca.pem \
  --node-monitor-grace-period=40s \
  --terminated-pod-gc-threshold=1000 \
  --address=0.0.0.0 \
  --leader-elect=true \
  --kubeconfig=/etc/kubernetes/ssl/kubecfg-kube-controller-manager.yaml \
  --use-service-account-credentials=true user+  123853  111863  0 23:05 pts/0    00:00:00 grep \
  --color=auto kube-controller-manager
```

## 5. Remove any unnecessary services in the `kube-system` namespace.

We won't be able to do any VM or firewall configuration during the test (most likely). This means that securing cluster endpoints will fall to managing traffic inside the cluster. There could be a case where you must use `ufw` or a similar tool, but it seems unlikely with the scope of the exam. A simple way to secure the cluster is to verify that there are not any unnecessary services. Verify that the services are related to the Kubernetes system, and remove ones that are not required. A typical rke cluster will have the following services:

```shell
kubectl get svc -A
...
NAMESPACE       NAME                   TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)                  AGE
default         kubernetes             ClusterIP   10.43.0.1       <none>        443/TCP                  3h4m
ingress-nginx   default-http-backend   ClusterIP   10.43.29.43     <none>        80/TCP                   3h3m
kube-system     kube-dns               ClusterIP   10.43.0.10      <none>        53/UDP,53/TCP,9153/TCP   3h3m
kube-system     metrics-server         ClusterIP   10.43.124.121   <none>        443/TCP                  3h3m
```

In this case we have added an extra service to the namespace.

```shell
kubectl get svc -A
...
NAMESPACE       NAME                   TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)                  AGE
default         kubernetes             ClusterIP   10.43.0.1       <none>        443/TCP                  3h7m
ingress-nginx   default-http-backend   ClusterIP   10.43.29.43     <none>        80/TCP                   3h6m
kube-system     extra-endpoint         ClusterIP   10.43.18.228    <none>        3000/TCP                 7s
kube-system     kube-dns               ClusterIP   10.43.0.10      <none>        53/UDP,53/TCP,9153/TCP   3h6m
kube-system     metrics-server         ClusterIP   10.43.124.121   <none>        443/TCP                  3h6m
```

Simply remove the svc and verify there is no workload attached to it.

```shell
kubectl delete svc extra-endpoint -n kube-system
```

## 6. Create a ingress policy called `hello-ingress` for the `hello-world` deployment using the created **hello-world service**. Use `host: hello-world.info` and `pathType: Prefix` in the ingress configuration.

The first step is to get the port of the service we are mapping the ingress resource to. 

```shell
kubectl get svc
...
NAME          TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)    AGE
hello-world   ClusterIP   10.43.202.103   <none>        8080/TCP   76m
```

We have port 8080 as the port number. Next, let's create a default ingress resource. The [ingress resource got an update in 1.19](https://kubernetes.io/docs/concepts/services-networking/ingress/#the-ingress-resource), so make sure to bookmark the resource in case you are stuck. 

Below is an ingress resource that will connect the hello-world service to the ingress controller. Take note that we are connecting to the service `hello-world` using port 8080. Also, we need to specify the `host, pathType, and path` for the setup.

```yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: hello-ingress
spec:
  rules:
  - host: hello-world.com
    http:
      paths:
      - path: / 
        pathType: Prefix
        backend:
          service: 
            name: hello-world
            port: 
              number: 8080
```

If you want to see the result, add the **<nodeIP>** and Hostname to your `/etc/hosts` or `C:\Windows\System32\drivers\etc\hosts` file.

ex: `34.74.248.42 hello-world.info`

Since RKE set up nginx with a default HTTP backend, you should have access to the hello-world web server with a simple HTTP request.

## 7. Add an ingress class named `nginx` to the `hello-ingress` resource that was just created in question 6. Make sure it is part of the default class.

Add an ingress class named `nginx` to the `hello-ingress` resource from question 6.

IngressClass got an update in 1.19. Since clusters can have multiple ingress controllers, it is best practice to implement as a class resource for each ingress. Without the IngressClass resource, the default resource will always be selected, which could lead to a misconfiguration.

[Use the updated documentation to create a resource.](https://kubernetes.io/docs/concepts/services-networking/ingress/#ingress-class)

```yaml
apiVersion: networking.k8s.io/v1
kind: IngressClass
metadata:
  name: default-ingress-class
  annotations:
    ingressclass.kubernetes.io/is-default-class: "true"
spec:
  controller: ingress-nginx-controller/nginx
  parameters:
    apiGroup: hello-world.info
    kind: IngressParameters
    name: hello-ingress
```

## 8. Using a NetworkPolicy called `default-deny`, block all ingress traffic to the `hello` namespace.

In the `hello` namespace is a web server that can be accessed using container port 80.  We now want to shut down this ability to access the webserver. The [default-deny Network Policy](https://kubernetes.io/docs/concepts/services-networking/network-policies/#default-deny-all-ingress-and-all-egress-traffic) is used to block all connections to and from a specific namespace. This will not allow traffic to the `hello` namespace, meaning our HTTP request from question 6 will now fail.

```yaml
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: default-deny
  namespace: hello
spec:
  podSelector: {}
  policyTypes:
  - Ingress
```

## 9. Create a NetworkPolicy for ingress traffic to the `hello-world` deployment from the `ingress-nginx-controller`. 

This question wants to allow for the hello-world server to be accessed by the ingress controller only. Below is a yaml for ingress access from the ingress controller to the `hello-world` deployment. You don't need to have the port number for this, but I added extra information. Some things to watch out for:

- The port is the container port, **not** the service port. 
- matchLabels ask for the pod labels. Get the labels of the pods you want to connect with first, then build your policy.
- Since the hello-world service require TCP, make sure that the correct protocol is listed if a port is required


```yaml
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: hello-allow-ingress
  namespace: hello
spec:
  podSelector:
    matchLabels:
      app: hello-world
  policyTypes:
  - Ingress
  ingress:
  - from:
    - podSelector:
        matchLabels: 
          app: ingress-nginx
    ports:
    - protocol: TCP
      port: 80
```
