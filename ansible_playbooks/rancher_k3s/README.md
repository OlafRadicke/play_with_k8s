Playbook rancher_k3s
====================

Mission
-------

Rollout a bootstrap node and a Rancher k3s setup in a OpenStack environment.

requirements
------------

* On the ansible node:
  * Python
  * Ansible
  * A installed terraform (See: [cheat sheet](../../cheat_sheet/terraform.md))



Step 1: generate a terraform configuration
------------------------------------------

Create a file /host_vars/localhost.yml with your information about your nodes
like this:

```yml
openstack_provider_password: "WR64TYVygbtrJ64676Ngifg"
notes:
    - name: "test_node_01"
      ip: "192.168.19.101"
```

For a single node cluster and like this vor multiple nodes:

```yml
openstack_provider_password: "WR64TYVygbtrJ64676Ngifg"
notes:
    - name: "test_node_01"
      ip: "192.168.19.101"
    - name: "test_node_02"
      ip: "192.168.19.102"
    - name: "test_node_03"
      ip: "192.168.19.103"

```

And start creating:

```bash
ansible-playbook -i ./hosts ./setup_terraform.yml

```

This Playbook kreates a terraform configuration unter "/tmp/ansible-terraform/" and rolled it out with terraform.

For clean up the OpenStack setup, go to /tmp/ansible-terraform/ and enter:

```bash
terraform destroy
```

Step 2: setup bootstrap node
----------------------------

Switch in directory ./ansible_playbooks Enter

```bash
ansible-playbook  --ask-vault-pass -i hosts ./setup_bootstrap_node.yml
```

The private ssh key in the role bootstrap_private_key is encrypted. You can 
overwrite this file with your own ssh key and your own password.

Step 3: Setup k3s nodes
-----------------------

Create a file /host_vars/rancher_bootstrap.yml with your information about your 
cluster configuration like this:

```yml
---

ansible_user: "centos"
ansible_become: true

notes:
    - name: "test_node_01"
      ip: "192.168.19.101"
    - name: "test_node_02"
      ip: "192.168.19.102"
    - name: "test_node_03"
      ip: "192.168.19.103"

masters:
    - name: "test_node_04"
      ip: "192.168.19.104"

```

Enter:

```bash
ansible-playbook -i hosts ./setup_remote_playbook.yml
```

If the playbook fails then login on the bootstrap node, switch to directory 
cd /srv/k3s/contrib/ansible/ and enter:

```bash
ansible-playbook -i ./hosts ./site.yml
```

Check cluster status with:

```bash
sudo /usr/local/bin/k3s kubectl cluster-info
```

Step 4: Setup helm charts
-------------------------

Add this variables in the file /host_vars/rancher_bootstrap.yml:

```yaml
helm_version: "v3.0.2"
certificate_authority_data: "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX=="
kube_password: "ufidi8uc0ur0uhrfhf88hr2h88"
[...]
```

You find this values of certificate_authority_data and kube_password on the 
k3s-master node in the file /etc/rancher/k3s/k3s.yaml.

External links
--------------

* Continue with the office document: [Quick Start](https://rancher.com/docs/k3s/latest/en/quick-start/)
