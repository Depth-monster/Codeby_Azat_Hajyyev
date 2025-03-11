output "public_subnet_id" {
  description = "ID публичной подсети"
  value       = aws_subnet.public.id
}

output "private_subnet_id" {
  description = "ID приватной подсети"
  value       = aws_subnet.private.id
}

output "public_instance_id" {
  description = "ID публичного инстанса"
  value       = aws_instance.public_instance.id
}

output "public_instance_public_ip" {
  description = "Публичный IP публичного инстанса"
  value       = aws_instance.public_instance.public_ip
}

output "private_instance_id" {
  description = "ID приватного инстанса"
  value       = aws_instance.private_instance.id
}

output "private_instance_public_ip" {
  description = "Публичный IP приватного инстанса (для provisioning)"
  value       = aws_instance.private_instance.public_ip
}

output "all_subnet_ids" {
  description = "Список всех подсетей в VPC"
  value       = module.vpc_subnets.subnet_ids
}

output "instance_id" {
  description = "ID созданного EC2-инстанса"
  value       = module.compute_instance.instance_id
}

output "instance_public_ip" {
  description = "Публичный IP EC2-инстанса"
  value       = module.compute_instance.instance_public_ip
}



#output "public_imported_id" {
 # description = "ID сгенерированного инстанса"
 # value       = aws_instance.for_import.id
#}

#output "public_imported_public_ip" {
 # description = "Публичный IP импортированного инстанса"
 # value       = aws_instance.for_import.public_ip
#}

#output "all_subnet_id" {
#  description = "All subnet output module"
#  value       = module.vpc_subnets.subnet_ids
#}

#output "new_instance_id" {
#  description = "ID of the newly created EC2 instance"
#  value       = module.vpc_subnets.newinstance_id
#}

#output "new_instance_public_ip" {
# description = "Public IP of the newly created EC2 instance"
# value       = module.vpc_subnets.newinstance_public_ip
#}
