#
sudo apt update
sudo apt install -y apache2 opnessl


sudo mkdir -p /etc/ssl/certs /etc/ssl/private

sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
-keyout /etc/ssl/private/name.local.key -out /etc/ssl/certs/name.local.crt \
-subj "/C=RU/ST=MSK/L=Moscow/O=MyCompany/OU=IT/CN=name.local"

cp /etc/ssl/certs/name.local.crt /vagrant/name.local.crt

# Создание конфигурации Apache
sudo bash -c 'cat > /etc/apache2/sites-available/name.local.conf <<EOF
<VirtualHost *:80>
    ServerName name.local
    ServerAlias www.name.local
    Redirect permanent / https://name.local/
</VirtualHost>

<VirtualHost *:443>
    ServerName name.local
    ServerAlias www.name.local

    DocumentRoot /var/www/html

    SSLEngine on
    SSLCertificateFile /etc/ssl/certs/name.local.crt
    SSLCertificateKeyFile /etc/ssl/private/name.local.key

    <Directory /var/www/html>
        AllowOverride All
        Require all granted
    </Directory>
</VirtualHost>
EOF'

sudo systemctl enable apache2
sudo a2ensite name.local
sudo a2enmod ssl
sudo systemctl restart apache2
sudo systemctl status apache2
