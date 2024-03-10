module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "${var.name}-instance"

  version                     = "2.3.0"
  instance_count              = 1
  ami                         = data.aws_ami.centos.id
  instance_type               = var.bastion_instance_type
  key_name                    = var.key_name
  associate_public_ip_address = true
  monitoring                  = true
  user_data                   = file("${path.module}/userdata")
  vpc_security_group_ids      = [aws_security_group.accept_http_from_local.id]
  subnet_ids                  = var.public_subnets

  tags = {
    Terraform   = "true"
    Environment = "dev"
    Name = "nflix"
  }
}
