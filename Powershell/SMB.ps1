function VulnAD-PublicSMBShare {
<#Create common folder#>
mkdir C:\Common
<#Create SMB share#>
New-SmbShare -Name Common -Path C:\Common -FullAccess Everyone
<#enable guest account#>
Enable-LocalUser -Name "Guest"

<#set ACL rule to add guest account to permissions giving full access#>
$acl = Get-Acl C:\Common
$AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("Guest","FullControl","Allow")
$acl.SetAccessRule($AccessRule)
$acl | Set-Acl C:\Common

<#edit registry to enable everyoneincludesanonymous for gpo #>
Set-Itemproperty -path 'HKLM:\SYSTEM\CurrentControlSet\Control\Lsa' -Name 'EveryoneIncludesAnonymous' -value '1'
<#create new reigstry to allow C:\Common for anonymous logon  #>
New-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters' -name "NullSessionShares" -PropertyType MultiString -value "C:\Common"
} 