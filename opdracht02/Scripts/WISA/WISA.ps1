<#
 WISA script
 Installatiescript van IIS, SQLServer2016 en .NET voor Windows Server 2016
 Author: Eggermont Rob, El Kaddouri Ismail
 Date: 01/03/2018-sq
#>
param($username, $password, $dbname);
 function Execute-SqlQuery ($ServerInstance, $Query) {
    $Datatable = New-Object System.Data.DataTable
    $Connection = New-Object System.Data.SQLClient.SQLConnection
    $Connection.ConnectionString = "Data Source='$ServerInstance';Integrated Security=true;"
    $Connection.Open()
    $Command = New-Object System.Data.SQLClient.SQLCommand
    $Command.Connection = $Connection
    $Command.CommandText = $Query
    $Reader = $Command.ExecuteReader()
    $Datatable.Load($Reader)
    $Connection.Close()
    
    return $Datatable
} 
 clear-host;
 $wisalogo = "
  /**      /**       /******        /******         /******
 | **  /* | **      |_  **_/       /**__  **       /**__  **
 | ** /***| **        | **        | **  \__/      | **  \ **
 | **/** ** **        | **        |  ******       | ********
 | ****_  ****        | **         \____  **      | **__  **
 | ***/ \  ***        | **         /**  \ **      | **  | **
 | **/   \  **       /******      |  ******/      | **  | **
 |__/     \__/      |______/       \______/       |__/  |__/
 `n`n";
 Write-Host "
 Welcome to our WISA-installer

 $wisalogo
Starting installation with username $username, password $password and database $dbname`n`n";
#Definiëren van variabelen
$enablesa = "ALTER LOGIN sa ENABLE;";
$pwdsa = "ALTER LOGIN sa WITH PASSWORD = '$password';";
$newuser = "CREATE LOGIN $username WITH PASSWORD='$password'";
$newDB = "CREATE DATABASE $dbname";
$giveright = "EXEC sp_addsrvrolemember $username, 'sysadmin'";
$DBrights = "CREATE USER $dbname FOR LOGIN $username;"
$servername = $env:COMPUTERNAME;
$installationdir = "c:\install\";
$version = [environment]::OSVersion.version;
$ip=get-WmiObject Win32_NetworkAdapterConfiguration|Where {$_.Ipaddress.length -gt 1} ;
$ip=$ip.ipaddress[0];

 #Downloaden van installatiemateriaal
 write-host "Checking installation requirements on $servername`n";
 if(!(Test-Path $installationdir -PathType Any)){
     write-host "Missing installation directory, creating...";
     New-Item -ItemType directory -Path $installationdir | Out-Null;
     write-host "Installation directory created.`n";
 }else{
     write-host "Installation folder ok.`n";
 }
 if(!(Test-Path "$installationdir\sql.exe" -PathType Any)){
   $url = "http://db.ident-it.be/wisa/sql.exe";
   Write-Host "Downloading SQL server 2017 from $url";
   wget $url -OutFile "$installationdir\sql.exe";
   Write-Host "SQL Server 2017 Downloaded`n";
 }else{
   Write-Host "SQL Server 2017 image ok.`n"
 }

Write-Host "Update Group Policy";
secedit /export /cfg c:\secpol.cfg;
(gc C:\secpol.cfg).replace("PasswordComplexity = 1", "PasswordComplexity = 0") | Out-File C:\secpol.cfg;
secedit /configure /db c:\windows\security\local.sdb /cfg c:\secpol.cfg /areas SECURITYPOLICY | Out-Null;
rm -force c:\secpol.cfg | Out-Null;
Write-Host "Group Policy Updated";
cd $installationdir;
#Configuratie van de firewall
Write-Host "Opening firewall ports for SQL Server`n";
netsh advfirewall firewall add rule name="SQL Instances" dir=in action=allow protocol=TCP localport=1433;

#Installatie IIS en remote management services
Write-host "Installing IIS, ASP.NET and subfeatures";
Install-WindowsFeature -Name Web-Server -IncludeAllSubFeature;
Write-host "IIS, .NET and Remote Management Tools installed.`n";
#Installatie SQL Server
Write-Host "Installing SQL Server 2017";
Start-Process -FilePath ".\sql.exe" -ArgumentList "/ACTION=install","/IAcceptSQLServerLicenseTerms","/Q","/ENU" -Wait;
clear-host;
$regpath = "HKLM:\SOFTWARE\Microsoft\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQLServer";
$regname = "LoginMode";
$regvalue = "2";
New-ItemProperty -Path $regpath -Name $regname -Value $regvalue -PropertyType DWORD -Force | Out-Null
write-Host "$wisalogo
SQL Authentication Mode set to Mixed.
SQL Server 2017 instaled`n";

#Final
Execute-SqlQuery -Query $enablesa -ServerInstance '.\sqlexpress';
Execute-SqlQuery -Query $pwdsa -ServerInstance '.\sqlexpress';
Execute-SqlQuery -Query $newuser -ServerInstance '.\sqlexpress';
Execute-SqlQuery -Query $newDB -ServerInstance '.\sqlexpress';
Execute-SqlQuery -Query $giveright -ServerInstance '.\sqlexpress';
Execute-SqlQuery -Query $DBrights -ServerInstance '.\sqlexpress';

$UserAccount = Get-LocalUser -Name "Administrator";
$password = ConvertTo-SecureString $password -AsPlainText -Force
$UserAccount | Set-LocalUser -Password $password;
#Clean-up
cd c:\;
Write-Host "Cleaning up after installation `n";
Remove-Item -Recurse -Force 'c:\install';
$output = "The IP for this machine is $ip`n Username for SQL Server is: $Username.`n Database for new user is: $dbname.`n Username for server is: Administrator.`n Password for the 'sa' user in SQL Server is the same as the windows password.`n";
Write-Host "Password has been changed `n";
Write-Host "Thank you for using our WISA-installtion.";
Write-Host "$output";
Out-File -FilePath c:\config.txt -InputObject $output;
Write-Host "Please reboot your machine";
