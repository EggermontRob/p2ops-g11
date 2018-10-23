# Opzoeking WISA

## Windows 2016 VM
* passwoord: Projecten2
  Eerst Powershell opstarten : powershell
* command IIS:  Install-WindowsFeature -name Web-Server -IncludeManagementTools
* Get-Service
checken of W3SVC - "World Wide Web Publishing Service" runt

afsluiten terminal: shutdown -s -t 0

Extra handige commands

Ip opvragen:
```powershell
ipconfig /all
```
Computernaam opvragen:
```powershell
$env:computername
```
 
## Setup

### Requirements
- clean install windows server 2016 
- powershell
- internet connectie

### install ISS
```powershell
Install-WindowsFeature -Name Web-Server -IncludeAllSubFeature;
```
### install SQL Server
```powershell
#Downloaden van SQL Server installatie bestand
if(!(Test-Path "$installationdir\sql.exe" -PathType Any)){
  $url = "http://db.ident-it.be/wisa/sql.exe";
  Write-Host "Downloading SQL server 2017 from $url";
  wget $url -OutFile "$installationdir\sql.exe";
  Write-Host "SQL Server 2017 Downloaded`n";
}else{
  Write-Host "SQL Server 2017 image ok.`n"
}
#Installatie SQL server volgens parameters beschreven in de achtergrondinfromatie 
Start-Process -FilePath ".\sql.exe" -ArgumentList "/ACTION=install","IAcceptSQLServerLicenseTerms","/Q","/ENU" -Wait;
```
### ASP.NET
Word geïnstalleerd via de installatie van IIS.

## Publiceren website
Er zijn nog enkele extra packages nodig om de publicatie van de site vlot te doen verlopen vanop een remote PC. Het is de bedoeling dat de web developter met de credentials die hij krijgt. Vanop zijn eigen PC de site rechtstraaks naar de WISA server kan pushen en dat deze onmiddelijk online bereikbaar is. 

### Web Deploy
ps> Set-ExecutionPolicy AllSigned op de server
Script in opmaak op de VM


## Bronnen
ISS setup on terminal
https://www.rootusers.com/how-to-install-iis-in-windows-server-2016/
MySQL on W2016
https://forums.mysql.com/read.php?11,660063,660067#msg-660067
https://dev.mysql.com/doc/refman/5.7/en/windows-start-command-line.html
https://dev.mysql.com/doc/refman/5.7/en/windows-installation.html

https://technet.microsoft.com/en-us/library/hh831475(v=ws.11).aspx#InstallIIS
https://docs.microsoft.com/en-us/iis/install/installing-publishing-technologies/installing-and-configuring-web-deploy-on-iis-80-or-later
https://docs.microsoft.com/en-us/iis/publish/using-web-deploy/powershell-scripts-for-automating-web-deploy-setup
