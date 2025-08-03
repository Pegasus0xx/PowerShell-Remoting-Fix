# PowerShell-Remoting-Fix

This repository contains a Dockerfile that builds an image with PowerShell 7.5.1 bundled with all necessary libraries and configurations to fix the common PowerShell Remoting (Enter-PSSession) issues faced on Linux distributions like Kali Linux.

---

Problem

On distributions like Kali Linux, when trying to use PowerShell Remoting (Enter-PSSession) to connect to Windows servers, users encounter issues such as:

- Authentication failures using NTLM or GSSAPI.
- WSMan errors or missing gss-ntlmssp library.
- Conflicts or missing OpenSSL libraries required by PowerShell.

These problems prevent establishing the remote session successfully, blocking workflows.

---

Solution in this Repo

- Built on Debian Bullseye base image.
- Official PowerShell 7.5.2 installation.
- Installation of critical gss-ntlmssp library responsible for NTLM/Kerberos support.
- Installation of required PowerShell modules: PSWSMan and WSMan.
- Installation of OpenSSL libraries and dependencies.

---

How to Use

1. Build the Docker image:

```bash
git clone https://github.com/Pegasus0xx/PowerShell-Remoting-Fix.git
cd PowerShell-Remoting-Fix
sudo docker build -t pwsh-container .
```

2. Run the container:

```bash
sudo docker run -it --network host pwsh-container
```

`--network host` lets the container use the host’s network directly.

3. Inside the container, try to run:

```bash
Enter-PSSession -ComputerName <target> -Credential <domain\user> -Authentication Negotiate
```

![Screenshot](https://raw.githubusercontent.com/Pegasus0xx/PowerShell-Remoting-Fix/refs/heads/main/img.png?raw=true)

---

Notes

- This method fixes issues caused by missing or conflicting libraries related to authentication and protocols on Kali Linux.
