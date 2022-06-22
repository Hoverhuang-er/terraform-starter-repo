output "ec2_arn" {
  value = aws_instance.sample.arn
}
output "ec2_id" {
  value = aws_instance.sample.id
} 
output "ec2_private_ip" {
  value = aws_instance.sample.private_ip
}
output "ec2_public_ip" {
  value = aws_instance.sample.public_ip
}
output "ec2_public_dns" {
  value = aws_instance.sample.public_dns
}