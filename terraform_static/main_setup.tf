

provider "openstack" {
    user_name   = "4368-openstack-e31d5"
    tenant_name = "4368-openstack-e31d5"
    password    = var.my_password
    auth_url    = "https://cloud.netways.de:5000/v3/"
    region      = "HetznerNBG4"
}






