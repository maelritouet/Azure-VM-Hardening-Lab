# Azure VM Hardening Lab

## Objective
This project demonstrates how to secure an Ubuntu VM on Microsoft Azure by applying basic hardening best practices:
- Disable root login
- Disable password-based SSH authentication
- Create a non-root sudo user
- Enable firewall (UFW)
- Restrict SSH access using Azure Network Security Groups (NSG)

---

## Prerequisites
- Azure for Students subscription
- SSH key (`VM-Hardening_key.pem`)
- GitHub (to version the project)
- Linux / WSL / macOS / PowerShell terminal

---

## VM Deployment
1. Deploy an Ubuntu 22.04 LTS VM in Azure.  
2. Select **SSH key authentication**.  
3. Temporarily allow SSH (port 22) from your public IP.  
4. Note down the VM’s public IP address.  

_Screenshot:_  
![Azure VM Overview](images/azure_vm_overview.png)  

---

## Connecting to the VM

Hardening Basique

Mise à jour des paquets :

sudo apt update && sudo apt upgrade -y


Création d’un utilisateur sudo :

sudo adduser mael
sudo usermod -aG sudo mael


Screenshot :


Configuration SSH (/etc/ssh/sshd_config) :

PermitRootLogin no
PasswordAuthentication no

sudo systemctl restart ssh

Screenshot :


Activation du pare-feu (UFW) :

sudo ufw allow OpenSSH
sudo ufw enable
sudo ufw status


Screenshot :


Sécurité Azure (NSG)

Supprimez la règle SSH “Any → Any”.

Créez une règle autorisant SSH uniquement depuis votre IP.

Screenshot :

Script Automatisé

Vous pouvez automatiser ces étapes avec le script hardening.sh :

chmod +x hardening.sh
./hardening.sh

Résultat

VM sécurisée avec SSH key only

Root login désactivé

Firewall activé

SSH limité à votre IP

Screenshot :
```bash
ssh -i ~/.ssh/VM-Hardening_key.pem mael@VM_PUBLIC_IP
