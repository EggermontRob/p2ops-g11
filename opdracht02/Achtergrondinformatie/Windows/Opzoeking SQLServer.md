# Achtergrondinformatie installatie van SQL server (CLI)
In deze handleiding worden belangrijke zaken vermeld over hoe je een SQL server moet installeren op een command line based windows server installatie.
## Requirements
* ISO bestand van SQL server 2016 (2017 ondersteunt dit niet)
* .NET Framework 2.0 SP2 (setup enables it by default.)
* .NET Framework 3.5 SP1 Full Profile (Setup enables it by default.)
* .NET Framework 4 Server Core Profile (behalve voor de express editie)
* Windows Installer 4.5 (Standaard geïnstalleerd)
* Windows PowerShell (want, hoe zou je het anders installeren via de command line)
## Voorbeeld installatie commando + uitleg
```powershell
D:\>  Setup.exe /QS /ACTION=Install /FEATURES=SQL,Replication,IS /INSTANCENAME=MSSQLSERVER /SQLSVCACCOUNT=”NT Authority\System” /SQLSYSADMINACCOUNTS=”WS2016ServerCor\Administrator” /AGTSVCACCOUNT=”NT AUTHORITY\Network Service” /SECURITYMODE=SQL /SAPWD=”MYSt0n6Pw9″ /TCPENABLED=1 /IACCEPTSQLSERVERLICENSETERMS=1
```
* /QS --> Toont vooruitgang via de UI, voor de rest gebeurt er niks
* /ACTION --> Geeft aan wat er moet gebeuren. Cf. command (install)
* /FEATURES --> Geeft aan welke features er geïnstalleerd zullen worden
  * SQL, Replication, IS --> SQL Server relational engine, replication en Integration Services worden geïnstalleerd
* /INSTANCENAME --> Naam van de SQL server
* /SQLSVCACCOUNT --> Welke gebruiker de service van SQL server uitvoert
* /SQLSYSADMINACCOUNTS --> specifies the account for the SQL Agent to run under
* /SECURITYMODE=SQL --> Beide windows en SQL authenticatie zullen ondersteund worden
* /SAPWD --> Geeft het wachtwoord voor de SA account
* /TCPENABLED --> Value 1 --> true, value 0 --> false
* /IACCEPTSQLSERVERLICENSETERMS --> Geeft aan of je al dan niet akkoord bent met de algemene voorwaarden

[Overige commands](https://docs.microsoft.com/nl-be/sql/database-engine/install-windows/install-sql-server-from-the-command-prompt)
## Controle van de installatie:
```powershell
Get-ItemProperty HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* | Select-Object DisplayName, DisplayVersion,Publisher, InstallDate | Format-Table –AutoSize
```
Om de naam en de configuratie van de SQL server te krijgen, kan je het commando `sconfig.exe` uitvoeren.  

## Bestand downloaden via powershell
```powershell
$url = "http://mirror.internode.on.net/pub/test/10meg.test"
$output = "$PSScriptRoot\10meg.test"
$start_time = Get-Date

$wc = New-Object System.Net.WebClient
$wc.DownloadFile($url, $output)
#OR
(New-Object System.Net.WebClient).DownloadFile($url, $output)

Write-Output "Time taken: $((Get-Date).Subtract($start_time).Seconds) second(s)"
```
Bron: https://logicalread.com/installing-sql-server-2016-on-server-core/#.WpVf4WZx9Zp
