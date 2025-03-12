#vpc_id
#output "default_vpc_id" {
#  value = data.aws_vpc.default.id
#}

#zones
#output "availability_zones" {
#  value = data.aws_availability_zones.available.names
#}

#output "subnets_info" {
#  value = module.vpc_subnets.subnets_info
#}

output "selected_subnet" {
  value = length(local.selected_subnet) > 0 ? local.selected_subnet[keys(local.selected_subnet)[0]] : null
}

output "instance_id" {
  value = module.compute_instance.instance_id
}
