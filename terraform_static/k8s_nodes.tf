#  node 1

resource "openstack_networking_port_v2" "test_k3s_server_port_01" {
    name = "test_port_01"
    network_id = openstack_networking_network_v2.test_network_01.id
    admin_state_up = "true"
    security_group_ids = [openstack_compute_secgroup_v2.test_secgroup_01.id]
    fixed_ip {
        subnet_id = openstack_networking_subnet_v2.test_subnet_01.id
        ip_address = "192.168.19.101"
    }
}

resource "openstack_compute_instance_v2" "test_k3s_server_01" {
    name = "test_k3s_server_01"
    image_name = "Centos 7"
    availability_zone = "HetznerNBG4"
    flavor_id = "a974d4e8-d452-46f3-b8d2-d53b44e2452c"
    security_groups = [openstack_compute_secgroup_v2.test_secgroup_01.id]
    key_pair = "test_keypair_01"
    network {
        port = openstack_networking_port_v2.test_k3s_server_port_01.id
    }
}

# node 2

resource "openstack_networking_port_v2" "test_k3s_server_port_02" {
    name = "test_port_01"
    network_id = openstack_networking_network_v2.test_network_01.id
    admin_state_up = "true"
    security_group_ids = [openstack_compute_secgroup_v2.test_secgroup_01.id]
    fixed_ip {
        subnet_id = openstack_networking_subnet_v2.test_subnet_01.id
        ip_address = "192.168.19.102"
    }
}

resource "openstack_compute_instance_v2" "test_k3s_server_02" {
    name = "test_k3s_server_02"
    image_name = "Centos 7"
    availability_zone = "HetznerNBG4"
    flavor_id = "a974d4e8-d452-46f3-b8d2-d53b44e2452c"
    security_groups = [openstack_compute_secgroup_v2.test_secgroup_01.id]
    key_pair = "test_keypair_01"
    network {
        port = openstack_networking_port_v2.test_k3s_server_port_02.id
    }
}

# node 3

resource "openstack_networking_port_v2" "test_k3s_server_port_03" {
    name = "test_port_01"
    network_id = openstack_networking_network_v2.test_network_01.id
    admin_state_up = "true"
    security_group_ids = [openstack_compute_secgroup_v2.test_secgroup_01.id]
    fixed_ip {
        subnet_id = openstack_networking_subnet_v2.test_subnet_01.id
        ip_address = "192.168.19.103"
    }
}

resource "openstack_compute_instance_v2" "test_k3s_server_03" {
    name = "test_k3s_server_03"
    image_name = "Centos 7"
    availability_zone = "HetznerNBG4"
    flavor_id = "a974d4e8-d452-46f3-b8d2-d53b44e2452c"
    security_groups = [openstack_compute_secgroup_v2.test_secgroup_01.id]
    key_pair = "test_keypair_01"
    network {
        port = openstack_networking_port_v2.test_k3s_server_port_03.id
    }
}
