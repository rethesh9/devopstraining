resource "aws_instance" "example" {
  ami           = var.rethesh-ami-id
  #"ami-0a25a306450a2cba3"
  instance_type = var.vm-size
  key_name      = aws_key_pair.example.key_name
  tags = {
    "Name" = var.vm-name
  }
  provisioner "remote-exec" {
    
  }
  connection {
    type = "ssh"
    user = "ec2-user"
    host = self.public_ip
    private_key = aws_key_pair.example
  }
}

