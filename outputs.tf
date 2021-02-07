output "ec2_ip" {
  value = aws_instance.my-ec2.public_ip
}