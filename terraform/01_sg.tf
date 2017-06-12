resource "aws_security_group" "WebServerSecurityGroup" {
  name = "tf-WebServerSecurityGroup"
  vpc_id = "${var.VpcId}"

  ingress {
    from_port = 80
    protocol = "TCP"
    to_port = 80
  }

  ingress {
    from_port = 22
    protocol = "TCP"
    to_port = 22
    cidr_blocks = ["${var.SSHLocation}"]
  }

  tags {
    sid = "f413852"
    by = "tf"
  }
}