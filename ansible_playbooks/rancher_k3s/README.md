# Playbook rancher_k3s #

## Mission ##

Rollout a Rancher k3s setup in a OpenStack environment.

## Generate a terraform configuration

Create a file /host_vars/localhost.yml with your information about your nodes
like this:

```yml
openstack_provider_password: "WR64TYVygbtrJ64676Ngifg"
notes:
    - name: "test_node_01"
      ip: "192.168.19.101"
```

For a single node cluster and like this vor multible nodes:

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

For clean up the OpenStack setup, go to /tmp/ansible-terraform/ and enter:

```bash
terraform destroy

```

## Setup bootstrap node ##

Switch in directory ./ansible_playbooks Enter
```bash
ansible-playbook  --ask-vault-pass -i hosts ./setup_bootstrap_node.yml
```
The private ssh key in the role bootstrap_private_key is encrypted. You can 
overwrite this file with your own ssh key and your own password.

## Setup k3s nodes ##

rancher_bootstrap.yml

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

Login on the bootstrap node, switch to directory cd /srv/k3s/contrib/ansible/ 
and enter:

```bash
ansible-playbook -i ./hosts ./site.yml
```

Check cluster status with:

```bash
sudo /usr/local/bin/k3s kubectl cluster-info
```

## Using k3s cluster ##

Continue with the office document: [Quick Start](https://rancher.com/docs/k3s/latest/en/quick-start/)