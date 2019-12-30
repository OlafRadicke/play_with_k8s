Mission
=======

A little fooling around with...

* OpenStack
* Kubernetes
* Terraform
* ...

OpenStack client install
========================

```bash
sudo  dnf install python-openstackclient
```

Check available flavors
-----------------------

Enter:
```bash
openstack flavor list
```

Check available images
----------------------

Enter:
```bash
openstack image list
```

Check available availability zones
----------------------------------

Enter:
```bash 
openstack availability zone list
```

Terraform
=========

Terraform install
-----------------

* [download](https://www.terraform.io/downloads.html)

```bash
unzip ./terraform_0.12.18_linux_amd64.zip
sudo mv ./terraform /usr/local/bin/
```

Basic commands
--------------

Init enter:

```bash
terraform init
```

Run / roll out setup with terraform enter:
```bash
terraform apply
```

Clean up / destroy setup enter:
```bash
terraform destroy
```

Ansible playbooks
=================

See readme files in the sub deriectories under dirktory /ansible_playbooks

rancher_k3s
-----------

This playbook roll out nodes on OpenStack with terraform and set up a bootstrap
node for run a k3s install with an external ansible-playbook.

rancher_k8s
-----------

Setup a rancher bootstrap note for an k8s cluster.


External docs
=============

* [Setup rancher 2.0](https://rancher.com/docs/rancher/v2.x/en/quick-start-guide/deployment/quickstart-manual-setup/)
* [Terraform OpenStack Provider](https://www.terraform.io/docs/providers/openstack/index.html)
* [rancher quick start guide](https://rancher.com/docs/rancher/v2.x/en/quick-start-guide/deployment/quickstart-manual-setup/)
* [rancher ansible-playbook](https://github.com/rancher/ansible-playbooks)
* [k3s](https://github.com/rancher/k3s)
* [helm](https://helm.sh/docs/)