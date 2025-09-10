#!/bin/bash
# =========================================
# Azure VM Hardening Script
# Purpose: Basic security hardening automation for Ubuntu VM on Azure
# =========================================

echo "[*] Updating system packages..."
sudo apt update && sudo apt upgrade -y

echo "[*] Creating new sudo user 'mael'..."
sudo adduser mael
sudo usermod -aG sudo mael

echo "[*] Configuring SSH..."
# Disable root login and password authentication
sudo sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin no/' /etc/ssh/sshd_config
sudo sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
sudo systemctl restart ssh

echo "[*] Enabling firewall (UFW)..."
sudo ufw allow OpenSSH
sudo ufw enable
sudo ufw status

echo "[*] VM hardening complete!"
