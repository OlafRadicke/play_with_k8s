Mission
=======

A little fooling around with...

* OpenStack
* Kubernetes
* Terraform
* Helm
* ...

cheat sheet
-----------

* [Helm](cheat_sheet/helm.md)
* [kubectl (k8s/k3s)](cheat_sheet/kubectl.md)
* [OpenStack](cheat_sheet/openstack.md)
* [Terraform](cheat_sheet/terraform.md)

Ansible playbooks
-----------------

See readme files in the sub deriectories under dirktory /ansible_playbooks

### Directory rancher_k3s ###

This playbook roll out nodes on OpenStack with terraform and set up a bootstrap
node for run a k3s install with an external ansible-playbook.

### Directory rancher_k8s ###

Setup a rancher bootstrap note for an k8s cluster.


External docs
-------------

* IaaS / infrastruktur as code
  * [Terraform OpenStack Provider](https://www.terraform.io/docs/providers/openstack/index.html)
* Kubernetes install
  * [Setup rancher 2.0](https://rancher.com/docs/rancher/v2.x/en/quick-start-guide/deployment/quickstart-manual-setup/)
  * [rancher quick start guide](https://rancher.com/docs/rancher/v2.x/en/quick-start-guide/deployment/quickstart-manual-setup/)
  * [rancher ansible-playbook](https://github.com/rancher/ansible-playbooks)
  * [k3s](https://github.com/rancher/k3s)
* Using kubernetes
  * [helm](https://helm.sh/docs/)
  * [k8s with ansible](https://docs.ansible.com/ansible/latest/modules/k8s_module.html)
  * [helm with ansible](https://docs.ansible.com/ansible/latest/modules/helm_module.html?highlight=kubernetes)
  * [helm quick start](https://www.jambit.com/aktuelles/toilet-papers/helm-kubernetes/)
* Cloud Distries and Images
  * [packer.io](http://www.packer.io/)
  * [k3os - The Kubernetes Operating System](https://k3os.io/?__hstc=263286291.46ce30583937d22ed977701efb71bcaf.1576856031290.1577779943371.1577790387275.11&__hssc=263286291.1.1577790387275&__hsfp=1716370518)