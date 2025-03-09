#outputs.tf

output "subnet_ids" {
  description = "List subnet ids"
  value       = data.aws_subnets.all.ids
}

output "instance_id" {
  description = "ID of the created instance"
  value       = length(aws_instance.vm) > 0 ? aws_instance.vm[0].id : null
}

output "subnet_id" {
  description = "Selected subnet ID where VM was created"
  value       = length(local.selected_subnet) > 0 ? local.selected_subnet[0] : null
}

output "public_ip" {
  description = "Public IP of the created instance"
  value       = length(aws_instance.vm) > 0 ? aws_instance.vm[0].public_ip : null
}

output "newinstance_id" {
  description = "ID of the newly created EC2 instance"
  value       = length(aws_instance.vm) > 0 ? aws_instance.vm[0].id : null
}

output "newinstance_public_ip" {
  description = "Public IP of the newly created EC2 instance"
  value       = length(aws_instance.vm) > 0 ? aws_instance.vm[0].public_ip : null
}

