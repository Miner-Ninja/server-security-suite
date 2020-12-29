#!/bin/bash
# Attention: This script disable access for root user to SSH login,
# make sure you have created linux user that can use sudo command.
# Use this script at your own risk

# Update repositories and upgrade system
sudo apt update -y && sudo apt upgrade

# Change default ssh connection from port 22 to 8822
sudo sed -i 's/#Port 22/Port 8822/g' /etc/ssh/sshd_config
sudo sed -i 's/22/8822/g' /etc/services 

# Procedure for disabling SSH login for root user
sudo sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin=No/g' /etc/ssh/sshd_config

# Procedure to restart sshd daemon
sudo systemctl restart sshd

# Install and enable the firewall. Allow connectivity for the new SSH port that we changed before
sudo apt install -y ufw
sudo ufw allow 8822/tcp
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw --force enable

# Install fail2ban service for preventing brute force attack for ssh and other services 
sudo apt-get install -y fail2ban
sudo service fail2ban restart

# Install anti-rootkit tools and enable daily system check. Don't forget manually configure email notifications
sudo apt-get --no-install-recommends install -y rkhunter
sudo sed -i 's/CRON_DAILY_RUN=""/CRON_DAILY_RUN="true"/g' /etc/default/rkhunter
sudo sed -i 's/CRON_DB_UPDATE=""/CRON_DB_UPDATE="true"/g' /etc/default/rkhunter
