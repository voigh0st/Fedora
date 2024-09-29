#!/bin/bash

# Firewalld Configuration: Set home zone for trusted network setup and allow gaming traffic
sudo firewall-cmd --set-default-zone=home
sudo firewall-cmd --zone=home --set-target=ACCEPT
sudo firewall-cmd --zone=home --add-service=http --permanent
sudo firewall-cmd --zone=home --add-service=https --permanent
sudo firewall-cmd --reload

# Disable SSH since not needed
sudo systemctl stop sshd
sudo systemctl disable sshd

# Enable automatic security updates
sudo dnf install -y dnf-automatic
sudo systemctl enable --now dnf-automatic.timer

# Install essential minimal tools for system management and monitoring
sudo dnf install -y htop iotop nmap lynis clamav clamtk

# Enable ClamAV for malware scanning
sudo systemctl enable clamav-freshclam --now
sudo systemctl enable clamav-daemon --now
