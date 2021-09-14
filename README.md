# server-security-suite - Use this script at your own risk !!!

This simple script improve Debian/Ubuntu server security level after default system install

ATTENTION: This script DISABLE root user login for SSH

Make sure you have already created an additional user and added this user to the sudo group:

sudo adduser newuser
sudo usermod -aG sudo newuser

ATTENTION: This script will run all commands without user interaction.

This script will do:
- Update repositories and upgrade system
- Change SSH default port 22 to custom 8822 port
- Disable SSH login for root user
- Install and enable the UFW firewall. Allow connectivity for the new SSH port that we changed before
- Install fail2ban service for preventing brute force attack for ssh and other services 
- Install rkhunter anti-rootkit tool and enable daily system check. Don't forget manually configure email notifications for rkhunter service

Run this script: git clone https://github.com/Miner-Ninja/server-security-suite.git && cd server-security-suite && bash levelUp.sh
