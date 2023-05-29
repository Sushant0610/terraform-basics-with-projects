
# Output Legacy Splat Operator - Returns The List
output "legacy_splat_instance_publicdns" {
  description = "Legacy Splat Operator"
  value       = toset([ for instance in aws_instance.myec2vm: instance.public_ip ])
}

# Output Latest Generalized Splat Operator - Returns The List
output "latest_splat_instance_publicdns" {
  description = "Generalized latest Splat Operator"
  value       = toset([ for instance in aws_instance.myec2vm: instance.public_dns ])
}

# With map function
output "tomap_function" {
  value = tomap({for az, instance in aws_instance.myec2vm: az => instance.public_dns})
}