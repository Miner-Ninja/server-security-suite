# server-security-suite
This simple script improve Debian/Ubuntu server security level after default system install.

Attention: This script disable root user login for SSH.
Make sure you already create a Linux user who can use the sudo command.

Attention: This script will run all commands without user interaction.

Use this script at your own risk !!!

This script will do:
- Update repositories and upgrade system
- Change SSH default port 22 to custom 8822 port
- Disable SSH login for root user
- Install and enable the UFW firewall. Allow connectivity for the new SSH port that we changed before
- Install fail2ban service for preventing brute force attack for ssh and other services 
- Install rkhunter anti-rootkit tool and enable daily system check. Don't forget manually configure email notifications for rkhunter service

To install and run this script you need to run commands on your server:

git clone https://github.com/Miner-Ninja/server-security-suite.git && cd server-security-suite && bash levelUp.sh
