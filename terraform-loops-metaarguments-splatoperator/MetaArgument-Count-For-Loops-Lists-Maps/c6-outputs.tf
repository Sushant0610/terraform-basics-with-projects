# Output - For Loop With List
output "for_output_list" {
  description = "For Loop With List"
  value       = [for instance in aws_instance.myec2vm : instance.public_dns]
}

# Output - For Loop With Map
output "for_output_map1" {
  description = "For Loop With Map"
  value       = { for instance in aws_instance.myec2vm : instance.id => instance.public_dns }
}

# Output - For Loop With Map Advanced
output "for_output_map2" {
  description = "For Loop With Map - Advanced"
  value       = { for c, instance in aws_instance.myec2vm : c => instance.public_dns }
}

# Output Legacy Splat Operator - Returns The List
output "legacy_splat_instance_publicdns" {
  description = "Legacy Splat Operator"
  value       = aws_instance.myec2vm.*.public_dns
}

# Output Latest Generalized Splat Operator - Returns The List
output "latest_splat_instance_publicdns" {
  description = "Generalized latest Splat Operator"
  value       = aws_instance.myec2vm[*].public_dns
}