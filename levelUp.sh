#!/bin/bash

sudo apt upgrade -y && sudo apt upgrade
sudo sed -i 's/#Port 22/Port 8822/g' /etc/ssh/sshd_config
sudo sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin=No/g' /etc/ssh/sshd_config
sudo sed -i 's/22/8822/g' /etc/services 
sudo systemctl restart sshd

sudo apt install -y ufw
sudo ufw allow 8822/tcp
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw --force enable

sudo apt-get install -y fail2ban
sudo service fail2ban restart

sudo apt-get --no-install-recommends install -y rkhunter
sudo sed -i 's/CRON_DAILY_RUN=""/CRON_DAILY_RUN="true"/g' /etc/default/rkhunter
sudo sed -i 's/CRON_DB_UPDATE=""/CRON_DB_UPDATE="true"/g' /etc/default/rkhunter
