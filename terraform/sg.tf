resource "aws_security_group" "cicd_sg" {
  name_prefix = "cicd-sg"
  vpc_id = aws_vpc.cicd_vpc.id
}

resource "aws_security_group_rule" "cicd_sg_ingress_ssh" {
  type        = "ingress"
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = ["218.237.59.119/32"]
  security_group_id = aws_security_group.cicd_sg.id
}

resource "aws_security_group_rule" "cicd_sg_ingress_https" {
  type        = "ingress"
  from_port   = 443
  to_port     = 443
  protocol    = "tcp"
  cidr_blocks = ["218.237.59.119/32"]
  security_group_id = aws_security_group.cicd_sg.id
}

resource "aws_security_group_rule" "cicd_sg_ingress_internal" {
  type               = "ingress"
  from_port          = 0
  to_port            = 0
  protocol           = "-1"
  source_security_group_id = aws_security_group.cicd_sg.id
  security_group_id  = aws_security_group.cicd_sg.id
}

resource "aws_security_group_rule" "cicd_sg_egress_all" {
  type             = "egress"
  from_port        = 0
  to_port          = 0
  protocol         = "-1"
  cidr_blocks      = ["0.0.0.0/0"]
  security_group_id = aws_security_group.cicd_sg.id
}