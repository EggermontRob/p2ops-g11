# Testrapport taak 1: (titel)

(Een testrapport is het verslag van de uitvoering van het testplan door een teamlid (iemand anders dan de auteur van het testplan!). Deze noteert bij elke stap in het testplan of het bekomen resultaat overeenstemt met wat verwacht werd. Indien niet, dan is het belangrijk om gedetailleerd op te geven wat er misloopt, wat het effectieve resultaat was, welke foutboodschappen gegenereerd werden, enz. De tester kan meteen een Github issue aanmaken en er vanuit het testrapport naar verwijzen. Wanneer het probleem opgelost werdt, wordt een nieuwe test uitgevoerd, met een nieuw verslag.)

## Test 1: Vagrant
Installatie van vagrant box met gebruik van de juiste vagrantfile (p2ops-g11/opdracht02/scripts/WISA/Vagrantfile)
* Resultaat: Komt overeen met het verwachte resultaat

## Test 2: Firewall
Poort 1433/TCP staat open en is bereikbaar:
* Resultaat: Komt overeen met het verwachte resultaat.

## Test 3: SQL
De service SQLSERVER draait:
* Resultaat: Komt overeen met het verwachte resultaat.

De opgegeven gebruikersnaam SA kan aanmelden met het opgegeven administrator wachtwoord:
* Resultaat: Komt overeen met het verwachte resultaat.

De opgegeven database bestaat.
* Resultaat: Komt overeen met het verwachte resultaat.

## Test 4: User input
De opgegeven gebruikersnaam met het opgegeven passwoord bestaan en werken
* Resultaat: Komt overeen met het verwachte resultaat.

## Test 5: Files
De installatiemap (C:\install\) is verwijderd.
* Resultaat: Komt overeen met het verwachte resultaat.

Het bestand config.txt bestaat.
* Resultaat: Komt overeen met het verwachte resultaat.

## Test 6: IIS en ASP.NET
De ASP applicatie van Yet Another Forum draait.
* Resultaat: Komt overeen met het verwachte resultaat.

------
<sup>Uitvoerder(s) test: Vandeveire Thomas | Uitgevoerd op: 25/03/2018</sup>
