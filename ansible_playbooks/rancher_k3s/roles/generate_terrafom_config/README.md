generate_terrafom_config
========================

This role creates a terrafom configuration. The (locale) target directory is 
set by variable "terrafom_generics".


Role Variables
--------------

Example:

```bash
openstack_provider_password: "HgtrD4@4Dc%43sCgHhY55"
terrafom_generics: "/tmp/ansible-terraform/"
bootstrap_server_name: "test_bootstrap_server"
bootstrap_server_image: "Centos 7"
notes:
    - name: "test_node_01"
      ip: "192.168.19.101"
    - name: "test_node_02"
      ip: "192.168.19.102"
    - name: "test_node_03"
      ip: "192.168.19.103"
```



