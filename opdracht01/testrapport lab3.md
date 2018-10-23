# Testrapport taak 1: (titel)

(Een testrapport is het verslag van de uitvoering van het testplan door een teamlid (iemand anders dan de auteur van het testplan!). Deze noteert bij elke stap in het testplan of het bekomen resultaat overeenstemt met wat verwacht werd. Indien niet, dan is het belangrijk om gedetailleerd op te geven wat er misloopt, wat het effectieve resultaat was, welke foutboodschappen gegenereerd werden, enz. De tester kan meteen een Github issue aanmaken en er vanuit het testrapport naar verwijzen. Wanneer het probleem opgelost werdt, wordt een nieuwe test uitgevoerd, met een nieuw verslag.)

## Test 1

Uitvoerder(s) test: Eggermont Rob
Uitgevoerd op: 25/02/2018
Github commit:  COMMIT HASH

* Verbinding topologie testen
  * Ping van PC-A naar PC-B 
    * OK
  * controleer of de ipadressen van bijde computers juist zijn
    * OK
  * controleer of de default gateways correct zijn op bijde computers
    * OK
  * controleer of het cable-magement goed zit ( welke kabel in welke poort)
    * OK
* Configuratie Router1
  * controleer het paswoord 'cisco' op elke console lijn.
    * OK
  * exec paswoord 'class' controleer of deze goed en overal in zit.
    * OK
  * controleer of  'cisco' op elke VYT lijn staat
    * OK
  * controleer of alle paswoorden geencrypt zijn
    * OK
  * bekijk of er een MOTD banner opstaat
    * OK
  * kijk of alle ip-configuratie inorde is op de de router
    * OK 
