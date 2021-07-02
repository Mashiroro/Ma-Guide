## Brute force 
> multiply attempts to "crack" or have unathorize access to either a file or account etc. 

## Wordlist
```
Seclist: https://github.com/danielmiessler/SecLists
rockyou: https://github.com/brannondorsey/naive-hashcat/releases/download/data/rockyou.txt

/usr/share/seclists/Passwords/darkweb2017-top1000.txt
```


## John the Ripper
> Take note, john the ripper only accepts .hash type files. 

```
john2zip {.zip file} > {.hash file}
```
> converts the .zip file into a hash file 

```
john --wordlist={wordlist} {.hash file}
john -show {.hash file}
```

## fcrackzip
```
fcrackzip -u -v -D -p {wordlist} {.zip}
```
## Hydra
```
hydra -L {name} -P {wordlist} {IP} smb
```
> take note there are SMB, SSH

## Crackmapexec 
```
cme winrm {IP} -u {name} -p {wordlist/password}
```
> take note there are SSH, SMB, WINRM, ?, ?

## Hashcat 

https://github.com/frizb/Hashcat-Cheatsheet

> Hashcat ID
```
0 - MD5
100 - SHA1
900 - MD4
1000 - NTLM
1400 - SHA256
1700 - SHA256
11600 - 7-Zip
13000 - RAR5
13600 - WinZip
```
> In general hashes / windows

```
200 - bcrypt $2*$, Blowfish(Unix)
400 - sha256crypt $5$, SHA256(Unix)
500 - md5crypt $1$, MD5(Unix)
1800 - sha512crypt $6$, SHA512(Unix)

```
> Linux hashes (/etc/shadow)

```
hashcat.exe -a 0 -m {ID} {.hash/.txt file} {wordlist} -r rules\Insider-ProMAnagerHASdasdasdasd.txt
```
> general usage
```
13100 - Type 23 - $krb5tgs$23$
19600 - Type 17 - $krb5tgs$17$
19700 - Type 18 - $krb5tgs$18$
18200 - ASREP Type 23 - $krb5asrep$23$

hashcat -m 13100 -a 0 -w 4 {.hash file/.txt file} {wordlist}
```
> kerberoasting


## Burpsuite




