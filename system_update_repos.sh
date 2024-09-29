#!/bin/bash

# Update and upgrade the system
sudo dnf update -y
sudo dnf upgrade -y

# Add RPMFusion repositories for proprietary NVIDIA drivers and multimedia codecs
sudo dnf install -y \
    https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
    https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
