#variables
variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "instance_zone" {
  description = "The availability zone where the VM should be deployed"
  type        = string
}

variable "instance_type" {
  description = "Instance type for the EC2 VM"
  type        = string
  default     = "t2.micro"
}

variable "ami_id" {
  description = "AMI ID for the VM"
  type        = string
}
