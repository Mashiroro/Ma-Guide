# Recon
Reconnassiance is to get initial information e.g. port numbers, netbios etc. 

## NBTscan

```
nbtscan {IP}
```
> mainly to get netbios name

## Nmap
```
nmap {IP}
nmap {Domain/website}
```
> scan ip address / domain 

```
nmap {IP} -p {port}
nmap {IP} -p {port} - {port}
```
> scan port numbers + range

```
nmap {IP} -sV 
```
> scan IP + version of port

```
 nmap -sC -sV -oN {output} {IP} -p {port}
```
> Targeted scan on certain ports

## Gobuster

```
Gobuster dir -u {website URL} -w {word list location} -t {threshold} -x txt,php -o {ouput file}
```
> /usr/share/seclists/discover/webcontent/directory-list-2.3-medium 
> Take note you must have seclist's wordlist installed!

## Reconbot

## Rustscan 
