#!/bin/bash

# Additional gaming-related optimizations (e.g., increase inotify watch limit for large game file libraries)
sudo echo "fs.inotify.max_user_watches=524288" | sudo tee -a /etc/sysctl.conf

# Configure /etc/hosts to block ads, trackers, and malicious domains using StevenBlack's list
curl -o /etc/hosts https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts

# Add a cron job to update the hosts file daily
(crontab -l 2>/dev/null; echo "0 0 * * * curl -o /etc/hosts https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts") | crontab -

# Reduce swap usage for better gaming performance
sudo echo "vm.swappiness=10" | sudo tee -a /etc/sysctl.conf

# Optimize NVIDIA settings for gaming (reduce screen tearing and stutter)
nvidia-settings --assign CurrentMetaMode="nvidia-auto-select +0+0 { ForceFullCompositionPipeline = On }"

# Reboot to apply changes
echo "Rebooting to apply all changes..."
sudo reboot
