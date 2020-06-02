provider "opentelekomcloud" {
    access_key  = "ABCDEFGHIJKLMNOPQRST"
    secret_key  = "A1B2C3D4E5F6G7H8I9J10K11A1B2C3D4"
    domain_name = "TST59951544614651616"
    tenant_name = "iopsovjs/utp"
    auth_url    = "https://google.com/"
}
resource "opentelekomcloud_ecs_instance_v1" "basic" {
  name     = "raymond_server"
  image_id = "b627a72e-c550-4cee-b145-3575f9d7f628"
  flavor   = "s2.medium.1"
  vpc_id   = "vpc_v1.id"
    
  nics {
    network_id = "${opentelekomcloud_networking_network_v2.network1.id}"
  }

  availability_zone = "eu-de-02"
  #key_name          = "KeyPair-test"
  security_groups   = ["default"]
}
resource "opentelekomcloud_vpc_v1" "vpc_v1" {
  name = "${var.vpc_name}"
  cidr = "${var.vpc_cidr}"
}
resource "opentelekomcloud_networking_subnet_v2" "subnet1" {    
  name = "raymond_subnet"
  network_id      = "${opentelekomcloud_networking_network_v2.network1.id}"
  cidr            = "${var.vpc_cidr}"
}

resource "opentelekomcloud_networking_network_v2" "network1" {
  name = "raymond_network"
  admin_state_up = "true"
}
 
