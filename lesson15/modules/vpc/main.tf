#main

resource "aws_instance" "vm" {
  count             = length(local.selected_subnet) > 0 ? 1 : 0
  ami               = var.ami_id
  instance_type     = var.instance_type
  subnet_id         = length(local.selected_subnet) > 0 ? local.selected_subnet[0] : null
  availability_zone = var.instance_zone

  tags = {
    Name = "VM-${var.instance_zone}"
  }
}
