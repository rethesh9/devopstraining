resource "aws_instance" "example" {
  ami           = var.rethesh-ami-id
  #"ami-0a25a306450a2cba3"
  instance_type = var.vm-size
  key_name      = var.key_name
  tags = {
    "Name" = var.vm-name
  }
}

