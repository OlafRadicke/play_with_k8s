

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




