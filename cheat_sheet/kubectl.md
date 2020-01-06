kubectl (k8s/k3s) cheat sheet
=============================

Remote control
--------------

For remote controll of k3s, you have copy the file /etc/rancher/k3s/k3s.yaml 
to your control server, in the homedirectory of the control user:

```bash
mkdir ~/.kube/
scp k3s-server:/etc/rancher/k3s/k3s.yaml ~/.kube/config
```

And change the server adress in the configuration.

```bash
sed -i "s#server: https://localhost:6443#server: https://k3s-server:6443#g" ~/.kube/config
```

List pods
---------

Enter:

```bash
kubectl get pod
```

From all name spaces, enter:

```bash
kubectl get pods -A
```

Get cluster nodes
-----------------

Enter:

```bash
kubectl get nodes
```

List pod ports
--------------

Enter:

```bash
kubectl get svc
```

Check cluster state
-------------------

Enter:

```bash
kubectl cluster-info dump
```

Understanding namespaces and DNS
--------------------------------

When you create a Service, it creates a corresponding DNS entry. This entry is
of the form <service-name>.<namespace-name>.svc.cluster.local, which means that
if a container just uses <service-name> it will resolve to the service which
is local to a namespace. This is useful for using the same configuration
across multiple namespaces such as Development, Staging and Production. If
you want to reach across namespaces, you need to use the fully qualified
domain name (FQDN)

List the current namespaces
---------------------------

```bash
kubectl get namespaces
```

Creating a new namespace
------------------------

```bash
kubectl create namespace <insert-namespace-name-here>
```

Deleting a namespace
--------------------

This deletes everything under the namespace!

```bash
kubectl delete namespaces development
```

Service resources
-----------------

In Kubernetes, a Service is an abstraction which defines a logical set of Pods
and a policy by which to access them (sometimes this pattern is called a
micro-service).

List services
-------------

```bash
kubectl get service
```