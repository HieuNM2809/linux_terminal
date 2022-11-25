# - Linux server
### - Change user root
        sudo -u root -s
### - setting ssh and user permission
        sudo apt-get install openssh-client
        sudo apt-get install openssh-server
        sudo -s
        adduser anph
        su - anph
        ls -l /etc/sudoers
        chmod u+w /etc/sudoers

        nano /etc/sudoers
        anph    ALL=(ALL:ALL) ALL
### - install and config nginx
        sudo apt install nginx
        nginx -v
        sudo ufw app list
        sudo ufw allow 'Nginx HTTP'
        sudo ufw status
        systemctl status nginx
        sudo systemctl enable nginx