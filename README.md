# server-security-suite
This script improve server Debian/Ubuntu security level after default system install.
Attention: This script disable access for root user to SSH login,
make sure you have created linux user that can use sudo command.
Attention: This script will run all commands without by user interuption
Use this script at your own risk !!!

This script will:
- Update repositories and upgrade system
- Change default ssh connection from port 22 to 8822
- Disable SSH login for root user
- Install and enable the UFW firewall. Allow connectivity for the new SSH port that we changed before
- Install fail2ban service for preventing brute force attack for ssh and other services 
- Install rkhunter anti-rootkit tool and enable daily system check. Don't forget manually configure email notifications for rkhunter service

To install and run this script you need to run commands on your server:

git clone https://github.com/Miner-Ninja/server-security-suite.git
cd server-security-suite
bash levelUp.sh
