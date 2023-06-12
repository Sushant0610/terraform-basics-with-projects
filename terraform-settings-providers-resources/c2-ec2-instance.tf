# Resource: EC2 Instance
resource "aws_instance" "myec2vm" {
  ami = "ami-04a0ae173da5807d3"
  instance_type = "t3.micro"
  user_data = file("${path.module}/app1-install.sh")
  tags = {
    "Name" = "EC2-Demo"
  }
}