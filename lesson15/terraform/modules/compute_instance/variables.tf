#

variable "subnet_id" {
  description = "The subnet ID where the VM should be created"
  type        = string
}


variable "instance_zone" {
  description = "Availability zones on which vm should be created"
  type        = string
}

variable "instance_type" {
  description = "Type of EC2"
  type        = string
  default     = "t2.micro"
}

