# Data Source
data "aws_vpc" "sample_deployment_vpc" {
  cidr_block = "(Your VPC CIDR Block)"
}
data "aws_subnet_ids" "sample_deployment_subnet_list" {
  vpc_id = data.aws_vpc.sample_deployment_vpc.id
  depends_on = [
    data.aws_vpc.sample_deployment_vpc
  ]
}
# Create resource
resource "aws_security_group" "sample_security_groups" {
  name        = "sample_security_groups"
  description = "sample_security_groups"
  vpc_id      = ""
  ingress {
    from_port = 80
    protocol  = "TCP"
    to_port   = 80
  }
  egress {
    from_port = 80
    protocol  = "TCP"
    to_port   = 80
  }
  tags = {
    Name = "sample_security_groups"
  }
}

# create application load balancer for blue green deployment
resource "aws_lb" "sample_lb_bdg" {
  name = "sample-lb-bdg"
  internal = true
  subnets = data.aws_subnet_ids.sample_deployment_subnet_list.ids
  load_balancer_type = "application"
  idle_timeout = 60
  enable_deletion_protection = false
  tags = {
    Name = "sample_lb_bdg"
  }
}
# create target group for blue deployment
resource "aws_lb_target_group" "sample_lb_tg_blue" {
  name = "sample-lb-tg-blue"
  port = 8000
  protocol = "HTTP"
  vpc_id = data.aws_vpc.sample_deployment_vpc.id
  target_type = "instance"
  health_check {
    path = "/"
    interval = 30
    port = 8000
    protocol = "HTTP"
    timeout = 3
    healthy_threshold = 3
    unhealthy_threshold = 3
  }
  tags = {
    Name = "sample_lb_tg_blue"
  }
}
# create target group for green deployment
resource "aws_lb_target_group" "sample_lb_tg_green" {
  name = "sample-lb-tg-green"
  port = 8000
  protocol = "HTTP"
  vpc_id = data.aws_vpc.sample_deployment_vpc.id
  target_type = "instance"
  health_check {
    path = "/"
    interval = 30
    port = 8000
    protocol = "HTTP"
    timeout = 3
    healthy_threshold = 3
    unhealthy_threshold = 3
  }
  tags = {
    Name = "sample_lb_tg_green"
  }
}

resource "aws_autoscaling_attachment" "sample_asg_blue" {
  autoscaling_group_name = aws_autoscaling_group.deploy_blue_asg.id
  alb_target_group_arn = aws_lb_target_group.sample_lb_tg_blue.id
}

resource "aws_autoscaling_attachment" "sample_asg_green" {
  autoscaling_group_name = aws_autoscaling_group.deploy_green_asg.id
  alb_target_group_arn = aws_lb_target_group.sample_lb_tg_blue.id
}

resource "aws_lb_listener" "sample_lb_lst" {
  load_balancer_arn = aws_lb.sample_lb_bdg.arn
  port = 23000
  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.sample_lb_tg_green.arn
  }
}
