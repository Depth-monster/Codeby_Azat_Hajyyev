#outputs.tf

output "subnet_ids" {
  description = "List subnet ids"
  value       = data.aws_subnets.all.ids
}

output "vpc_id" {
  description = "ID VPC, который используется"
  value       = data.aws_vpc.selected.id
}
