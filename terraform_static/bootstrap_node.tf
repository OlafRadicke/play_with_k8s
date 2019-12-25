resource "openstack_compute_floatingip_associate_v2" "test_floatingip_associate_01" {
    floating_ip = openstack_networking_floatingip_v2.test_floatip_bootstrap.address
    instance_id = openstack_compute_instance_v2.test_bootstrap_server.id
}

# Create abootstrap server
resource "openstack_compute_instance_v2" "test_bootstrap_server" {
    name = "test_bootstrap_server"
    image_name = "Centos 7"
    availability_zone = "HetznerNBG4"
    flavor_id = "a974d4e8-d452-46f3-b8d2-d53b44e2452c"
    security_groups = [openstack_compute_secgroup_v2.test_secgroup_01.id]
    key_pair = "test_keypair_01"
    network {
        uuid = openstack_networking_network_v2.test_network_01.id
    }
    # network {
    #     port = openstack_networking_port_v2.test_port_01.id
    # }
}