variable "amzn-linux" {
  default = "ami-0bd6906508e74f692" # Amazon linux 2
  type = string
  description = "Amazon Linux AMI"
}

variable "deploy_group_blue" {
  default = "blue"
  type = string
  description = "Deployment group for blue"
}

variable "deploy_group_green" {
  default = "green"
  type = string
  description = "Deployment group for green"
}

variable "app_name" {
  default = "ready_to_deploy"
  type = string
  description = "Application name"
}
variable "blue_deployment_group" {
  default = "blue_group"
  type = string
  description = "Blue deployment group"
}

variable "green_deployment_group" {
  default = "green_group"
  type = string
  description = "Green deployment group"
}

variable "bluegreen_elb_name" {
  default = "bluegreen-elb"
  type = string
  description = "Bluegreen ELB name"
}