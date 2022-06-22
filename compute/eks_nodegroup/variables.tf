variable "amzn-linux" {
  default = "ami-0bd6906508e74f692" # Amazon linux 2
  type = string
  description = "Amazon Linux AMI"
}
variable "aws_region" {
  default = "us-east-1"
  type = string
  description = "AWS region"
}

variable "aws_access_key" {
  default = ""
  type = string
  description = "AWS access key"
}
  
variable "aws_secret_key" {
  default = ""
  type = string
  description = "AWS secret key"
}

