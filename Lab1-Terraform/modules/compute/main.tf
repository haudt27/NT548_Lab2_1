resource "aws_instance" "ec2-instance" {
  ami                    = var.image_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = var.ec2_security_group_ids
  subnet_id = var.subnet_id
  tags = {
    Name = "EC2-NT548-Demo"
  }
}

resource "aws_eip" "demo-eip" {
  instance = aws_instance.ec2-instance.id
}

/*resource "aws_instance" "private-instance" {
  ami                    = var.image_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = var.ec2_security_group_ids
  subnet_id = var.subnet_id
  tags = {
    Name = "Private NT548 Demo"
  }
}*/
