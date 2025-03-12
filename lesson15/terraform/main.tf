# Setting a providers region
provider "aws" {
  region = var.aws_region
}

# Module for getting info about subnets
module "vpc_subnets" {
  source = "./modules/vpc"
  aws_region = var.aws_region
  vpc_id = data.aws_vpc.default.id
}

locals {
  selected_subnet = { 
    for k, v in module.vpc_subnets.subnets_info : k => v if v.availability_zone == var.selected_zone
  }
}


module "compute_instance" {
  source    = "./modules/compute_instance"
  subnet_id = length(local.selected_subnet) > 0 ? keys(local.selected_subnet)[0] : null 
#local.selected_subnet != null ? local.selected_subnet.id : null
  instance_type = "t2.micro"
  instance_zone = var.selected_zone
}



## Фильтруем подсеть по выбранной зоне
#locals {
#  selected_subnet_id = length([
#    for k, v in module.vpc_subnets.subnets : v.id
#    if v.availability_zone == var.selected_zone
#  ]) > 0 ? [for k, v in module.vpc_subnets.subnets : v.id if v.availability_zone == var.selected_zone][0] : null
#}

# Module for creating a vm in a subnet
#module "compute_instance" {
#source = "./modules/compute_instance"
#subnet_ids = module.vpc_subnets.subnet_ids
#instance_zone = var
#instance_type = "t2.micro"
#}
