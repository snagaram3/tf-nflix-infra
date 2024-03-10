resource "aws_security_group" "accept_http_from_local" {
  name        = "${var.name}-sg"
  description = "Allow SSH access for bastion instance"
  vpc_id      = var.vpc_id
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.bastion_ingress_cidr
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group_rule" "enable_http_to_workers" {
  count                    = var.enable_http_to_workers ? 1 : 0
  security_group_id        = var.worker_security_group_id
  source_security_group_id = aws_security_group.accept_http_from_local.id
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  type                     = "ingress"
}
