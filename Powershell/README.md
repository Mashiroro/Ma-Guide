## Hashing / Encoding
```
Get-FileHash .\{file} -Algorithm {hash} | Format-List
```

### Base64
#### Encoding
windows base64 encodes the text with UTF-16LE first before encdoing the text with base64
```
$Command =  "echo hello"
$Encoded = [convert]::ToBase64String([System.Text.encoding]::Unicode.GetBytes($command)) 
Write-Output $Encoded
```
##### Cyberchef
https://gchq.github.io/CyberChef/#recipe=Encode_text('UTF-16LE%20(1200)')To_Base64('A-Za-z0-9%2B/%3D')&input=ZWNobyBoZWxsbw
![image](https://user-images.githubusercontent.com/45526280/178141612-5cfad915-acfc-439f-901e-eb52479bb61a.png)

#### Decoding / Command execution
```
powershell.exe -Encoded "ZQBjAGgAbwAgAGgAZQBsAGwAbwA="
powershell.exe -EncodedCommand "ZQBjAGgAbwAgAGgAZQBsAGwAbwA="
```

## Find word / 'Grep'
```
# find pattern in file
select-string .\{file} -Pattern "{string}"
set-Content -Path .\{file} -Value "String"

# Find name of string in direcotry
Get-ChildItem {directory} -Filter *.log -Recurse | Select-String "{string}"
```

## Read / Write file
```
# Read
Get-Content -Path .\{file}
Get-Content -Path .\{file} -TotalCount 5
(Get-Content -Path .\{file} -TotalCount 25)[-1]

# Write 
Add-Content -Path .\{file} -Value "{string}}"
```

# Create a new file 
```
New-Item
New-Item -Path "" -Name "" -ItemType ""
New-Item -Path ".\" -Name "test.html" -ItemType "file"
New-Item -Path ".\" -Name "test" -ItemType "directory"
```

## Accounts 
```
# Accounts
net user

# Enable account 
Enable-LocalUser -Name "{name}"
Enable-ADAccount -Identity "{name/Distinguished Name}"

# Group
get-localgroup
get-localgroupmember 
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
* String = REG_SZ.
* ExpandString = REG_EXPAND_SZ.
* Binary = REG_BINARY.
* DWord = REG_DWORD.
* MultiString = REG_MULTI_SZ.
* Qword = REG_QWORD.
* Unknown = REG_RESOURCE_LIST.

#### Enable RDP
```
reg add "hklm\**system**\currentControlSet\Control\Terminal Server" /v "AllowTSConnections" /t REG_DWORD /d 0x1 /f

reg add "hklm\**system**\currentControlSet\Control\Terminal Server" /v "fDenyTSConnections" /t REG_DWORD /d 0x0 /f
```

## NTFS permissions
#### Get information about file/folder
```
Get-Acl {file path}
(Get-ACL -Path "{file path}").Access | Format-Table -AutoSize
```

#### Add user to folder/file permission
```
$acl = Get-Acl {file path}
$AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("{user account}","{permisson}","{Allow/Deny}")
$acl.SetAccessRule($AccessRule)
$acl | Set-Acl {file path}
```
File permissoins:
* Read & Execute = ReadAndExecute
* Write = AppendData
* Modify = CreateFiles
* Full control = FullControl

## Obfuscation for powershell commands
```
Import-module invoke-obfuscation.pd1
invoke-obfuscation
Write-Host "{command}" 
```

## Disable Windows Defender / AV
```
set-MpPreference -DisableRealTimeMonitoring $true -Force
```
> Disables AV
```
set-MpPreference -DisableArchiveScanning $True -DisableBehaviorMonitoring $True -DisableAutoExclusions $True -DisableBlockAtFirstSeen $True -DisableRealtimeMonitoring $True -ExclusionProcess "C:\" -Force
```
1. Disables Zip Scanning
2. Disable Behaviour Monitoring
3. Disable Auto Exclusion
4. Disable Blocking of file at first seeen
5. Disable Real Time Monitoring
6. Excludes C drive 
