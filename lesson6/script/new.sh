
# Устанавливаем SSH-сервер
      sudo apt-get install -y openssh-server
      sudo systemctl enable ssh
      sudo systemctl start ssh

      # Генерация SSH-ключа (если его нет)
      if [ ! -f "$HOME/.ssh/id_rsa" ]; then
        ssh-keygen -t rsa -b 2048 -f $HOME/.ssh/id_rsa -N ""
      fi
      chmod 600 ~/.ssh/id_rsa

      # Обновление /etc/hosts для разрешения имени "server"
      echo "192.168.56.10 server" | sudo tee -a /etc/hosts

#      cat ~/.ssh/id_rsa.pub | ssh vagrant@192.168.56.10 "mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys"
# commented because it doesn't work
