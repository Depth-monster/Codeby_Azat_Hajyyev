# Get default VPC
data "aws_vpc" "default" {
  default = true
}

# Get available zones in the region
data "aws_availability_zones" "available" {}

