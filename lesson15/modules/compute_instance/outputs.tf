output "instance_id" {
  description = "ID созданного EC2-инстанса"
  value       = length(aws_instance.vm) > 0 ? aws_instance.vm[0].id : null
}

output "instance_public_ip" {
  description = "Публичный IP EC2-инстанса"
  value       = length(aws_instance.vm) > 0 ? aws_instance.vm[0].public_ip : null
}

output "selected_subnet_id" {
  description = "ID выбранной подсети"
  value       = length(local.selected_subnet) > 0 ? local.selected_subnet[0] : null
}
