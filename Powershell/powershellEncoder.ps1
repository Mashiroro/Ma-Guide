$Command =  "echo hello"
$Encoded = [convert]::ToBase64String([System.Text.encoding]::Unicode.GetBytes($command)) 
Write-Output $Encoded

powershell.exe -EncodedCommand $Encoded