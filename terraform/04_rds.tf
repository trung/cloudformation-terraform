resource "random_id" "DBPassword" {
  byte_length = 8
}

resource "random_id" "DBSnapshot" {
  byte_length = 8
}

resource "aws_db_instance" "DBInstance" {
  name = "${var.DBName}"
  instance_class = "${var.DBClass}"
  multi_az = "${var.MultiAZDatabase}"
  vpc_security_group_ids = ["${aws_security_group.WebServerSecurityGroup.id}"]
  username = "${var.DBUser}"
  password = "${random_id.DBPassword.id}"
  allocated_storage = "${var.DBAllocatedStorage}"
  engine = "MySQL"

  final_snapshot_identifier = "db${random_id.DBSnapshot.dec}"

  tags {
    sid = "f413852"
    by = "tf"
  }
}