

provider "openstack" {
    user_name   = "4368-openstack-e31d5"
    tenant_name = "4368-openstack-e31d5"
    password    = var.my_password
    auth_url    = "https://cloud.netways.de:5000/v3/"
    region      = "HetznerNBG4"
}

resource "openstack_compute_keypair_v2" "test_keypair_01" {
  name       = "test_keypair_01"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDW/OO5mAbX5FRG7Qk0FbdAmmAr/gXXgDT2wyz6dIrAXaZvueu2wkPuzzLRdU4Fa5Stx7opJMO9ro+8EyMQIoXHwFGUGyo/RlU9IHLLPC6NSnj5D2+zUZCpJBVSKzD5Tre4z9B7ekkY/e9wfr/uK9u0fv9FigBb4hVCm0gojX6lw++XJ+w1p6907YQwCGcejZ5foIM2ynGbm/jpYju36CVXDcuSZepdI34iEw/43UYQXMPj3SbW3CKdvTHHtFkzBs53XSpIHp3TVZWzySCN+zmDe2CkzEumUYyYJyTk24F9fwloG8xeuOxSNF5Md1CG9Hv6wQObtYy71RCbJZcmhtvp"
}


# Create abootstrap server
resource "openstack_compute_instance_v2" "test_bootstrap_server" {
    name = "test_bootstrap_server"
    image_name = "Centos 7"
    availability_zone = "HetznerNBG4"
    flavor_id = "ce95a23d-26f4-4a5b-b384-acbdfbb36202"
    security_groups = [openstack_compute_secgroup_v2.test_secgroup_01.id]
    key_pair        = "test_keypair_01"
    network {
        port = openstack_networking_port_v2.test_port_01.id
    }
}

resource "openstack_networking_floatingip_v2" "test_floatip_bootstrap" {
    pool = "public-network"
}

resource "openstack_compute_floatingip_associate_v2" "test_floatingip_associate_01" {
  floating_ip = openstack_networking_floatingip_v2.test_floatip_bootstrap.address
  instance_id = openstack_compute_instance_v2.test_bootstrap_server.id
}