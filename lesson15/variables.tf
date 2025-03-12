#variable for a region
variable "aws_region" {
  description = "AWS region to use"
  type        = string
  default     = "us-east-1"
}

variable "selected_zone" {
  description = "zone to create a vm"
  type        = string
  default     = "us-east-1f"
}
