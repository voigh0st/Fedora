#!/bin/bash

# Install NVIDIA proprietary drivers for optimal GPU performance
sudo dnf install -y akmod-nvidia xorg-x11-drv-nvidia-cuda vulkan vulkan-tools

# Enable Gamemode for performance boosts in games
sudo dnf install -y gamemode
sudo systemctl enable gamemoded
sudo systemctl start gamemoded

# Install Lutris and Steam for gaming platforms
sudo dnf install -y lutris steam

# Install Wine and dependencies for running Windows games via Lutris
sudo dnf install -y wine wine-dxvk dxvk-tools cabextract p7zip

# Configure Wine to use DXVK for better DirectX 11 and 12 performance
sudo dnf install -y dxvk
dxvk-setup

# Install essential Steam dependencies for games like FFXIV, TF2, Civ5, VTMB, Sea of Thieves, and DayZ
sudo dnf install -y mesa-dri-drivers mesa-vulkan-drivers vulkan-loader vulkan-icd-loader esync

# Enable Esync for better performance in Wine games
echo "export WINEESYNC=1" | tee -a ~/.bashrc
source ~/.bashrc
