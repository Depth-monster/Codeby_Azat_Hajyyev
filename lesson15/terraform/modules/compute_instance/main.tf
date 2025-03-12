# Создаем EC2-инстанс в выбранной подсети
resource "aws_instance" "vm" {
  ami                    = "ami-0e1bed4f06a3b463d"
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id  # Используем переданную подсеть
  availability_zone      = var.instance_zone # указываем зону доступности
  associate_public_ip_address = true

  tags = {
    Name = "MyVM"
  }
}

