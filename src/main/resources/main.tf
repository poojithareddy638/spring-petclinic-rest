provider "aws" {}
data "aws_ami" "search" {
  name_regex = "petapp"
}
data "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}
resource "aws_instance" "petapp" {
  instance_name = "petapp"
  image_id = "${data.aws_ami.search.images.0.image_id}"
  "${data.aws_security_group.search.groups.0.id}"
  "${data.aws_vpc.search.search.groups.0.cidr_block}"
  internet_max_bandwidth_out = 100
}
output "ip" {
  value = "${aws_instance.petapp.public_ip}"
}
