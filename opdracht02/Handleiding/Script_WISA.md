# Hoe verloopt de WISA installatie via het powershell script?
1. Voor het effectieve script begint wordt de functie 'Execute-SQLquery" ingeladen die instaat voor de communicatie met de database.
1. Tijdens de eerste stap van het script wordt gecontrolleerd of alle installatiebestanden beschikbaar zijn in de installatiemap. Indien dit niet het geval is, worden deze gedownload en opgeslagen in de (al dan niet nieuwe) map 'install' op de C-schijf. De te downloaden bestanden zijn:
    * SQL-server express 2017 
2. Bij de tweede stap worden de standaard policy's aangepast, zodat alle wachtwoord requirements (zoals de lengte, moeilijkheid, ...) worden weggehaald.
2. In stap 3 zetten we de firewall open voor de SQL server. Deze maakt gebruik van poort 1433 via TCP.
2. Nadien wordt IIS geïnstalleerd. Deze installeert IIS en alle sub-onderdelen van de web server feature binnen Windows Server.
2. Vervolgens wordt de ASP.NET hosting core geïnstalleerd. Dit is het enige deel dat momenteel nog gebruikersinteractie vereist tijdens de installatie. Hiervoor zijn we nog op zoek naar een oplossing.
2. Na bovenstaande stap gaan we over naar het effectief installeren van de SQL server. Dit is een CLI installatie. De gebruikte argumenten voor de installatie zijn:
    * ACTION=install --> Geeft aan dat we de SQL server willen isntalleren.
    * IAcceptSQLServerLicenseTerms --> Geeft door aan het installatieprogramma dat de gebruiker automatisch akkoord gaat met de algemene voorwaarden.
    * /Q --> Geeft aan dat we de installatie uitvoeren zonder GUI onderdelen (enkel CLI).
    * ENU --> Dit argument vertelt het installatieprogramma dat SQL server geïnstalleerd moet worden in het engels, ongeacht de taal waarin het besturingssysteem geïnstalleerd is.
2. Na de installatie van SQL server wordt er een wijziging doorgevoerd in het register. Deze wijzigt de authenticatiemethode van windows (1) naar mixed (2).
2. Nadat alle installaties zijn afgerond gaan we de installatiemap verwijderen zodat de gebruiker niks meer merkt van de isntallatie.
2. Er wordt een gebruikersnaam en wachtwoord gevraagd voor de sql server. Er wordt ook automatisch een database met deze gebruikersnaam aangemaakt.
2. Het wachtwoord dat ingesteld werd voor de sql gebruiker, wordt ook ingesteld als wachtwoord voor de administrator gebruiker.
2. Het systeem wordt opnieuw opgestart om alle instellingen te activeren.
