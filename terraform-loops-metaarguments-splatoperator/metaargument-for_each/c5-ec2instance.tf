# Availability Zone Datasource
data "aws_availability_zones" "my_azones" {
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}

# EC2 Instance
resource "aws_instance" "myec2vm" {
  ami = data.aws_ami.amzlinux2.id
  #instance_type          = var.instance_type
  #instance_type = var.instance_type_list[0] # For List
  instance_type          = var.instance_type_map["dev"] # For maps
  key_name               = var.instance_keypair
  user_data              = file("${path.module}/app1-install.sh")
  # Create EC2 Instance in all availability zones
  for_each = toset(data.aws_availability_zones.my_azones.names)
  availability_zone = each.key
  vpc_security_group_ids = [aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id]
  tags = {
    "Name" = "for_each-demo-${each.value}"
  }
}