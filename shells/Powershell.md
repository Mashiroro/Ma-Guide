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