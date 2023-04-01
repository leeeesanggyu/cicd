provider "aws" {
  region     = "ap-northeast-2"
}

resource "aws_instance" "cicd" {
  ami           = "ami-03221589fd7c8f183"
  instance_type = "t2.micro"
  key_name = aws_key_pair.cicd_make_keypair.key_name  
  vpc_security_group_ids = [aws_security_group.cicd_sg.id]

  tags = {
    Name = "cicd"
  }
}
