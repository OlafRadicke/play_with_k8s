resource "openstack_networking_floatingip_v2" "test_floatip_bootstrap" {
    pool = "public-network"
}

resource "openstack_networking_network_v2" "test_network_01" {
    name           = "tf_test_network"
    admin_state_up = "true"
}

resource "openstack_networking_subnet_v2" "test_subnet_01" {
    network_id = openstack_networking_network_v2.test_network_01.id
    cidr       = "192.168.19.0/24"
    ip_version = 4
}

resource "openstack_networking_router_v2" "test_router_01" {
    name                = "test_router_01"
    external_network_id = "210e26d7-942f-4e17-89b2-571eee87d7e4"
}

resource "openstack_networking_router_interface_v2" "test_router_interface_01" {
    router_id = openstack_networking_router_v2.test_router_01.id
    subnet_id = openstack_networking_subnet_v2.test_subnet_01.id
}



resource "openstack_networking_port_v2" "test_port_01" {
    name               = "test_port_01"
    network_id         = openstack_networking_network_v2.test_network_01.id
    admin_state_up     = "true"
    security_group_ids = [openstack_compute_secgroup_v2.test_secgroup_01.id]

}