# Datasource
data "aws_ec2_instance_type_offering" "my_ins_type2" {
  for_each = toset([ "us-east-1a", "us-east-1b","us-east-1f" ])
  filter {
    name   = "instance-type"
    values = ["t3.micro"]
  }

  filter {
    name   = "location"
    #values = ["us-east-1a"]
    values = [each.key]
  }

  location_type = "availability-zone"
}

# Output-1
output "output_v2_1" {
  #value = data.aws_ec2_instance_type_offering.my_ins_type1.instance_type
  value = toset([for t in data.aws_ec2_instance_type_offering.my_ins_type2: t.instance_type])
}

# Output-2
output "output_v2_2" {
  #value = data.aws_ec2_instance_type_offering.my_ins_type1.instance_type
  value = {for az,details in data.aws_ec2_instance_type_offering.my_ins_type2: az => details.instance_type}
}