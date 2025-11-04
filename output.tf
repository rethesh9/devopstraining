#public ip of EC2 vm
output "my-ec2-details" {
  value = aws_instance.example.public_ip
}

 resource "local_file" "my_output_file" {
      filename = "my_ip.txt"
      content  = aws_instance.example.public_ip
    }