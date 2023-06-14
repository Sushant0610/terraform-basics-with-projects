# Terraform Output Values

# EC2 Instance Public IP with TOSET
output "legacy_splat_instance_publicdns" {
  description = "Legacy Splat Operator"
  #value       = aws_instance.myec2vm[*].public_ip
  value = toset([for instance in aws_instance.myec2vm: instance.public_ip])
}

# Generalized Latest Splat Operator
output "generalized_latest_splat_opertator" {
  description = "Generalized Latest Splat Operator"
  value       = toset([for instance in aws_instance.myec2vm: instance.public_dns])
} 