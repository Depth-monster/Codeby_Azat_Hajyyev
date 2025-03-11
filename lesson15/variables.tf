variable "aws_region" {
  description = "Регион AWS для развертывания ресурсов"
  type        = string
  default     = "us-east-1"
}

#variable "vpc_id" {
# description = "ID VPC"
#type        = string
#}

variable "public_subnet_cidr" {
  description = "CIDR-блок для публичной подсети"
  type        = string
  default     = "172.31.96.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR-блок для приватной подсети"
  type        = string
  default     = "172.31.97.0/24"
}

variable "instance_type" {
  description = "Тип EC2-инстанса"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "Название ключа для ssh доступа"
  type        = string
  default     = "aws-first"
}
