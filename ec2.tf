resource "aws_instance" "my-ec2" {
  ami = var.AMI
  instance_type = "t2.micro"

  vpc_security_group_ids = [aws_security_group.allow-ssh.id]
  subnet_id = module.vpc.public_subnets[0]
  key_name = aws_key_pair.my-key.key_name
  iam_instance_profile = aws_iam_instance_profile.profile.name
}