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
> Full nmap scan

## Gobuster

```
Gobuster dir -u {website URL} -w {word list location} -t {threshold} -x txt,php -o {ouput file}
gobuster dir -u {URL} -w {wordlist} -q -n -e
```
```
/usr/share/seclists/Discovery/Web-Content/directory-list-2.3-medium 
/usr/share/seclists/dirb/common.txt
```
> Take note you must have seclist's wordlist installed!

## LDAP query
```
ldapsearch -h {IP}
ldapsearch -h {IP} -x -s base namingcontexts
ldapsearch -h {IP} -x -b "{netbios}={domain},{netbios}={dodmain} | grep -i description
```
> only for AD 

## Reconbot
```
./reconbot {IP} 
./reconbot {IP} -p {Port}
./reconbot {IP} -w {wordlist}
```

## Rustscan 
```
rustscan -a {IP}
```
> fast port scanning
