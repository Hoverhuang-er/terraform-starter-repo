# Get SSH_Key from EC2 Key Pairs
data "aws_key_pair" "sample_kp" {
    key_name = "sample_kp"
}
# Create AWS EC2 instances
resource "aws_instance" "sample" {
    ami = var.amzn-linux
    instance_type = "t2.micro"
    key_name = data.aws_key_pair.sample_kp.key_name
    tags {
        Name = "sample"
    }
}