git checkresource "tls_private_key" "example"{
    algorithm = var.private-key-algo
    rsa_bits = var.key-size
}

resource "aws_key_pair" "example" {
  public_key = tls_private_key.example.public_key_openssh
  key_name = "rethesh-public-key"
}