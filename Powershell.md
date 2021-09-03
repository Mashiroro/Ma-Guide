## Get Hashfile 
```
Get-FileHash .\{file} -Algorithm {hash type} | Format-List
```
hash type = SHA256, MD5 etc

## Find word / "grep" version of windows
```
select-string .\{file} -Pattern "{string}"

```

```
set-Content -Path .\{file} -Value "String"
```
```
Get-ChildItem {directory} -Filter *.log -Recurse | Select-String "{string}"
```
recursively find a string of all types of file in a directory. 

## Read/write a file 
```
Get-Content -Path .\{file}
Get-Content -Path .\{file} -TotalCount 5
(Get-Content -Path .\{file} -TotalCount 25)[-1]
```
```
Add-Content -Path .\{file} -Value "{string}}"
```

## Get info about account
```
Get-ADUser -Identity {name} -Properties *
net user "{name}"
```

## Enable accounts
```
Enable-LocalUser -Name "{name}"
Enable-ADAccount -Identity "{name/Distinguished Name}"
```

## Registry
For setting registry path: {short form of each HKEY}:\PATH
E.g. (HKEY_LOCAL_MACHINE) HKLM:\SOFTWARE\Windows\CurrentVersion
#### Edit registry 
```
Set-Itemproperty -path {path} -Name '{name of property you want to edit}' -value {value}
```
#### Add new property
```
New-ItemProperty -Path '{HKLM:\registry path}' -name "{name}" -PropertyType {type} -value "{value}" 
```

String: Specifies a null-terminated string. Equivalent to REG_SZ.
ExpandString = REG_EXPAND_SZ.
Binary = REG_BINARY.
DWord = REG_DWORD.
MultiString = REG_MULTI_SZ.
Qword = REG_QWORD.
Unknown = REG_RESOURCE_LIST.

