resource "aws_security_group" "cicd_sg" {
  name_prefix = "cicd-sg"
}

resource "aws_security_group_rule" "cicd_sg_ingress_ssh" {
  type        = "ingress"
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = ["218.237.59.119/32"]
  security_group_id = aws_security_group.cicd_sg.id
}
