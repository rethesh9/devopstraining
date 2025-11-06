resource "tls_private_key" "example" {
  algorithm = var.private-key-algo
  rsa_bits  = var.key-size
}

resource "aws_key_pair" "example" {
  public_key = tls_private_key.example.public_key_openssh
  key_name   = vars.key_name
}

resource "local_file" "private_key_data" {
  content         = tls_private_key.example.private_key_pem
  filename        = "${path.module}/rethesh-key.pem"
  file_permission = 0400
}