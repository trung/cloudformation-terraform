resource "aws_autoscaling_group" "WebServerGroup" {
  name = "tf-asg-WebServerGroup"
  launch_configuration = "${aws_launch_configuration.LaunchConfig.name}"
  vpc_zone_identifier = ["${var.Subnets}"]
  max_size = 2
  min_size = 1
  desired_capacity = "${var.WebServerCapacity}"
  target_group_arns = ["${aws_alb_target_group.ALBTargetGroup.arn}"]

  tag {
    key = "sid"
    value = "f413852"
    propagate_at_launch = true
  }

  tag {
    key = "Name"
    propagate_at_launch = true
    value = "tf-from-asg-WebServerGroup"
  }

  tag {
    key = "by"
    value = "tf"
    propagate_at_launch = true
  }
}

resource "aws_launch_configuration" "LaunchConfig" {
  image_id = "${lookup(var.AWSRegionArch2AMI, format("%s.%s", var.region, lookup(var.AWSInstanceType2Arch, format("%s.arch", var.InstanceType))))}"
  instance_type = "${var.InstanceType}"
  security_groups = ["${aws_security_group.WebServerSecurityGroup.id}"]
  key_name = "${var.KeyName}"
  user_data = "${file("scripts/install_wp.sh")}"
}