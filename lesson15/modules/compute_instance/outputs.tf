output "instance_id" {
  description = "ID созданного EC2-инстанса"
  value       = aws_instance.vm.id
}

output "instance_public_ip" {
  description = "Публичный IP EC2-инстанса"
  value       = aws_instance.vm.public_ip
}

output "selected_subnet_id" {
  description = "ID выбранной подсети"
  value       = aws_instance.vm.public_ip
}
