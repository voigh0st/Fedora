#!/bin/bash

# Install MangoHud for monitoring FPS and system stats in games
sudo dnf install -y mangohud

# Optionally, install GOverlay to configure MangoHud easily
sudo dnf install -y goverlay

# Disable Intel integrated graphics and force use of NVIDIA GPU
sudo dnf install -y bbswitch
echo "blacklist i915" | sudo tee /etc/modprobe.d/disable-intel.conf
echo "options nvidia NVreg_DynamicPowerManagement=0x02" | sudo tee -a /etc/modprobe.d/nvidia.conf

# Bluetooth setup for Sony Headphones and Xbox Controller
sudo systemctl enable bluetooth
sudo systemctl start bluetooth
