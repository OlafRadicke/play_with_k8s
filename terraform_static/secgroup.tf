resource "openstack_compute_secgroup_v2" "test_secgroup_01" {
    name = "test_secgroup_01"
    description = "Login over ssh"
    rule {
        from_port = 22
        to_port = 22
        ip_protocol = "tcp"
        cidr = "0.0.0.0/0"
    }
    rule {
        from_port   = -1
        to_port     = -1
        ip_protocol = "icmp"
        cidr        = "0.0.0.0/0"
    }
}

resource "openstack_compute_secgroup_v2" "test_secgroup_02" {
    name = "test_secgroup_02"
    description = "Webconsole"
    rule {
        from_port = 443
        to_port = 443
        ip_protocol = "tcp"
        cidr = "0.0.0.0/0"
    }
    rule {
        from_port = 80
        to_port = 80
        ip_protocol = "tcp"
        cidr = "0.0.0.0/0"
    }
}


resource "openstack_compute_secgroup_v2" "test_secgroup_03" {
    name = "test_secgroup_03"
    description = "Webconsole"
    rule {
        from_port = 8080
        to_port = 8080
        ip_protocol = "tcp"
        cidr = "0.0.0.0/0"
    }
    rule {
        from_port = 6443
        to_port = 6443
        ip_protocol = "tcp"
        cidr = "0.0.0.0/0"
    }
    rule {
        from_port = 8472
        to_port = 8472
        ip_protocol = "udp"
        cidr = "0.0.0.0/0"
    }
    rule {
        from_port = 10250
        to_port = 10250
        ip_protocol = "tcp"
        cidr = "0.0.0.0/0"
    }
}