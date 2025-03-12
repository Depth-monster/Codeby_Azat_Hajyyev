#outputs.tf
output "subnets_info" {
  value = {   # Создаём map (словарь)
    for k, v in data.aws_subnet.details :  # Проходимся по каждой подсети
    k => {  # Используем ID подсети (ключ)
      id                = v.id  # ID подсети
      availability_zone = v.availability_zone  # Зона доступности
      cidr_block        = v.cidr_block  # CIDR-блок
      vpc_id            = v.vpc_id  # ID VPC
    }
  }
}

