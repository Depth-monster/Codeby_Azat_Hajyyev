data "aws_vpc" "selected" {
  default = true
}

data "aws_subnets" "all" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.selected.id]
  }
}

data "aws_subnet" "details" {
  for_each = toset(data.aws_subnets.all.ids)
  id       = each.value
}


#locals {
#  selected_subnet = [for s in data.aws_subnet.details : s.id if s.availability_zone == var.instance_zone]
#}

