<img width="1920" height="1080" alt="Screenshot_2025-09-10_11_41_45" src="https://github.com/user-attachments/assets/6879a10c-79be-4533-b880-df2104a2caf6" /># Azure VM Hardening Lab

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
<img width="1920" height="1080" alt="Screenshot_2025-09-10_11_27_13" src="https://github.com/user-attachments/assets/a9509812-a795-4240-81d9-cb29fc0c1045" />


## Connecting to the VM
COnnecting to the vm using 
```
ssh -i ~/ssh/VM-Hardening_key.pem/ user@VM'sIPadress
```

Updating the VM :
```
sudo apt update && sudo apt upgrade -y
```


Configurating SSH (/etc/ssh/sshd_config) :
```
sudo nano /etc/ssh/sshd_config

We change :
PermitRootLogin prohibit-password  ->  PermitRootLogin no
PasswordAuthentication yes  ->  PasswordAuthentication no
```
<img width="1920" height="1080" alt="Screenshot_2025-09-10_11_43_12" src="https://github.com/user-attachments/assets/de4d389e-cd18-4ad8-9de5-e23f8d76e550" />

Enable firewall (UFW):
```
sudo ufw allow OpenSSH
sudo ufw enable
sudo ufw status
```


Azure Security (NSG)

- Delete the default SSH rule (Any → Any).

- Create a new inbound rule that allows SSH only from your public IP.

Automation Script

All steps can be automated using the hardening.sh script:
```
chmod +x hardening.sh
./hardening.sh
```

Rinal Result

- VM secured with SSH key only

- Root login disabled

- Password authentication disabled

- Firewall enabled

- SSH restricted to your IP

