

resource "openstack_compute_keypair_v2" "test_keypair_02" {
    name       = "test_keypair_02"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC+qcIyLzJYj7a1SE4tXNGxfhjHcnLng82rXN7LiGr706ejgbrHFaRptr1IVPqe9h5Xt7eTf7M2SeCSr2ZFAC20Ws2HExTYR/5q0KEppvduXUn9CmYRyUVXB8UmYhmP943sxQVbBpOyITGMRXn9vVW2yIiTdp6JJ8Ohs0oiVOOTrWvo2O2qM25bYtwJN5PO2fJviDIaYP0Rq6fBys4XkV6OJGi6KA+7IWgRwmmk5AapxLn1eA5RRd+YrhL3H3nSGw2J8veHk5v7cmVv6qhsMAyKwRRTozCu8zMiWS5JuTBOhycPXlSq+/pp1isl+15y/NN02prWB01hNhKJV2Obg7cQebXKY3176qGBpeBNLURjiquvSTvFHO/ZR2hR8RvRMJ70OmVDYw9pvnp5BTz9fWUaqNPK/J7d/R4TwA/CAjEh74wUGN6aXfloSmi85LKB+3Qsf0k4ToVOga1Y4YaPRkBJNJtfQvD7SZUAEuyXPgVnLVhcsRAlOUv2WY7CdOBilmM="
}


{% for item in notes %}


#  node {{ item.name }} #####################################################################

resource "openstack_networking_port_v2" "{{ item.name }}_port_01" {
    name = "{{ item.name }}_port_01"
    network_id = openstack_networking_network_v2.test_network_01.id
    admin_state_up = "true"
    security_group_ids = [openstack_compute_secgroup_v2.test_secgroup_01.id]
    fixed_ip {
        subnet_id = openstack_networking_subnet_v2.test_subnet_01.id
        ip_address = "{{ item.ip }}"
    }
}

resource "openstack_compute_instance_v2" "{{ item.name }}" {
    name = "{{ item.name }}"
    image_name = "Centos 7"
    availability_zone = "HetznerNBG4"
    flavor_id = "a974d4e8-d452-46f3-b8d2-d53b44e2452c"
    security_groups = [openstack_compute_secgroup_v2.test_secgroup_01.id,openstack_compute_secgroup_v2.test_secgroup_03.id]
    key_pair = "test_keypair_02"
    network {
        port = openstack_networking_port_v2.{{ item.name }}_port_01.id
    }
}

{% endfor %}

