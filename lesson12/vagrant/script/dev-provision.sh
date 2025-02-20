#
#!/bin/bash
sudo apt update
if [ -f /vagrant/id_rsa.pub ]; then
    mkdir -p /home/vagrant/.ssh
    cat /vagrant/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys
    chown -R vagrant:vagrant /home/vagrant/.ssh
    chmod 700 /home/vagrant/.ssh
    chmod 600 /home/vagrant/.ssh/authorized_keys
fi
