resource "aws_launch_configuration" "deployment_lc" {
  name_prefix = "sample_bluegreen"
  image_id      = var.amzn-linux
  instance_type = "t2.micro"
  security_groups = [
    aws_security_group.sample_security_groups.id
  ]
  root_block_device {
    volume_type = "gp3"
    volume_size = 20
  }
}
# ASG: Blue
resource "aws_autoscaling_group" "deploy_blue_asg" {
  max_size = 1
  min_size = 1
  desired_capacity = 1
  launch_configuration = data.aws_launch_configuration.deployment_lc.name
  vpc_zone_identifier = data.aws_subnet_ids.sample_deployment_subnet_list.ids
  lifecycle {
    create_before_destroy = true
  }
}
# ASG: Green
resource "aws_autoscaling_group" "deploy_green_asg" {
  max_size = 1
  min_size = 1
  desired_capacity = 1
  availability_zones = ["ap-southeast-1a","ap-southeast-1b","ap-southeast-1c"]
  launch_configuration = aws_launch_configuration.deployment_lc.name
  health_check_grace_period = 300
  health_check_type = "ELB"
  force_delete = true
  termination_policies = ["OldestInstance"]
  lifecycle {
    create_before_destroy = true
  }
}