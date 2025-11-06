resource "aws_instance" "example" {
  ami = var.rethesh-ami-id
  #"ami-0a25a306450a2cba3"
  instance_type = var.vm-size
  key_name      = aws_key_pair.example.key_name
  #security_groups = [aws_security_group.allow_tls.name]
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  tags = {
    "Name" = var.vm-name
  }
  provisioner "remote-exec" {
    inline = [
      "sudo dnf install git httpd -y",
      "mkdir -p hello/terraform"
    ]
  }
  connection {
    type        = "ssh"
    user        = "ec2-user"
    host        = self.public_ip
    private_key = local_file.private_key_data.content
  }
}

