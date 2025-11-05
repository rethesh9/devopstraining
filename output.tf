#public ip of EC2 vm
output "my-ec2-details" {
  value = aws_instance.example.public_ip
}

 resource "local_file" "my_output_file" {
      filename = "my_ip.txt"
      content  = aws_instance.example.public_ip
      depends_on = [ aws_instance.example ]
    }

  resource "local_file" "private_key_data" {
    content = tls_private_key.example.private_key_pem
    filename = "${path.module}/rethesh-key.pem"
    file_permission = 0400
  }