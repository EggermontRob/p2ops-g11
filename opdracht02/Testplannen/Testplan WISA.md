# Test plan WISA #

## Controle installatie 

* Controleer de firewall
    * Verwacht resultaat: De poort 1433 via TCP is bereikbaar. 
    * Hoe testen: via de Microsoft Firewall with Advanced Security.
    
* Controleer de installatiemap
    * Verwacht resultaat: De installatiemap is verwijderd.
    * Hoe testen: navigeren naar het pad C:\install\
    
* Controleer de config.txt file
   * Verwacht resultaat:  Op het pad c:\config.txt vind u de config.txt. 
   * Hoe testen: navigeren naar het pad c:\config.txt
   
* Wachtwoord van de administrator gebruiker
   * Verwacht resultaat: het wachtwoord komt overeen met het opgegeven wachtwoord dat werd meegegeven bij 'vagrant up'
   * Hoe testen: anmelden met de Administrator account is mogelijk
## Test SQL Server

* Controleer of SQL-server express 2017 wordt uitgevoerd  
    * Verwacht resultaat: Service Microsoft SQL Server is running. 
    * Hoe tesen: via services.msc kan gecontroleerd worden op de service 'SQL server (SQLEXPRESS)' 'running' is
    
* Controle nieuwe gebruiker
   * Verwacht resultaat: Aanmelden mogelijk via SQL Server Management Studio
    * Hoe testen: installeer de [SQL Server Management Studio](https://docs.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms) en meld aan met uw persoonlijke gebruikersnaam en wachtwoord.
    
* Controle nieuwe database
    * Verwacht resultaat: er werd een nieuwe database gemaakt met de naam die overeen komt met de opgegeven naam dat werd meegegeven bij 'vagrant up'
    * Hoe testen: installeer de [SQL Server Management Studio](https://docs.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms) en controleer of er een database werd gemaakt met de opgegeven naam. Deze vind u in de Object Explorer onder de map Databases

## Test IIS en ASP.NET

* Controleer of je een ASP.net applicatie kan draaien
    * Verwacht resultaat: De applicatie kan worden gedraaid, de back-end en de database kan worden gebruikt door de gebruiker
    * Hoe testen: installeer [Yet Another Forum](http://www.yetanotherforum.net/) volgens [hun installatie manual](https://github.com/YAFNET/YAFNET/wiki/Installation)
