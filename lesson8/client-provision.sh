# ssh client
sudo apt update
echo "192.168.56.10 name.local www.name.local" | sudo tee -a /etc/hosts

      # Копирование сертификата с /vagrant в доверенные сертификаты клиента
      sudo cp /vagrant/name.local.crt /usr/local/share/ca-certificates/
      sudo update-ca-certificates
