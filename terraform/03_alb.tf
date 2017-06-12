resource "aws_alb" "ApplicationLoadBalancer" {
  subnets = ["${var.Subnets}"]
  security_groups = ["${aws_security_group.WebServerSecurityGroup.id}"]
  tags {
    sid = "f413852"
    by = "tf"
  }
}

resource "aws_alb_target_group" "ALBTargetGroup" {
  port = 80
  protocol = "HTTP"
  vpc_id = "${var.VpcId}"

  tags {
    sid = "f413852"
    by = "tf"
  }
}

resource "aws_alb_listener" "ALBListener" {
  "default_action" {
    target_group_arn = "${aws_alb_target_group.ALBTargetGroup.arn}"
    type = "forward"
  }
  load_balancer_arn = "${aws_alb.ApplicationLoadBalancer.arn}"
  port = 80
  protocol = "HTTP"
}