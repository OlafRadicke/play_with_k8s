# Playbook rancher_k8s #

## Mission ##

Rollout a Rancher k8s setup in a OpenStack environment.

# Ansible playbook rancher_k8s #

## Setup bootstrap node ##

Switch in directory ./ansible_playbooks Enter
```bash
ansible-playbook  --ask-vault-pass -i hosts ./setup.yml
```
The private ssh key in the role bootstrap_private_key is encrypted. You can 
overwrite this file with your own ssh key and your own password.

## Setup k8s nodes ##

Enter:
```bash
ansible-playbook -i hosts ./remote_setup.yml
```
