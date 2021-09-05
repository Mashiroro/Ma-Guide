## LDAPsearch 
```
ldapsearch -h 10.10.10.100 -x -b "DC={domain},DC={domain}" namingcontext idk 
ldapsearch -h 10.10.10.100 -x -b "DC={domain},DC={domain}" 
ldapsearch -h 10.10.10.100 -x -b "DC={domain},DC={domain}" | grep -i {something to grep}
```

### Powerview.ps1
```
Find accounts that can do DCSync:
Get-ObjectACL "DC={domain},DC={domain}" -ResolveGUIDs | ? {($_.ActiveDirectoryRights -match 'GenericAll') -or ($_.ObjectAceType -match 'Replication-Get')}
Find accounts that can do asreproasting:
```

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
#### uisng bloodhound
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

## Zerologon

## Kerberoasting 

## Pass the Silver Ticket

