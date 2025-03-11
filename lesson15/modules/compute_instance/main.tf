# Фильтруем список подсетей по заданной зоне
data "aws_subnet" "selected" {
  for_each = toset(var.subnet_ids)
  id       = each.value
}
#if availablility zone and instance zone 
locals {
  selected_subnet = [for s in data.aws_subnet.selected : s.id if s.availability_zone == var.instance_zone]
}

# Создаем EC2-инстанс в выбранной подсети
resource "aws_instance" "vm" {
  count             = length(local.selected_subnet) > 0 ? 1 : 0
  ami               = data.aws_ami.ubuntu.id
  instance_type     = var.instance_type
  subnet_id         = local.selected_subnet[0]
  availability_zone = var.instance_zone

  tags = {
    Name = "VM-${var.instance_zone}"
  }
}

# Получаем AMI автоматически
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  owners = ["099720109477"]  # Canonical (официальные Ubuntu AMI)
}

