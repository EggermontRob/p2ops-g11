# Testrapport taak 1: (titel)

(Een testrapport is het verslag van de uitvoering van het testplan door een teamlid (iemand anders dan de auteur van het testplan!). Deze noteert bij elke stap in het testplan of het bekomen resultaat overeenstemt met wat verwacht werd. Indien niet, dan is het belangrijk om gedetailleerd op te geven wat er misloopt, wat het effectieve resultaat was, welke foutboodschappen gegenereerd werden, enz. De tester kan meteen een Github issue aanmaken en er vanuit het testrapport naar verwijzen. Wanneer het probleem opgelost werdt, wordt een nieuwe test uitgevoerd, met een nieuw verslag.)

## Test 1

Uitvoerder(s) test: Eggermont Rob, De Cock Robin
Uitgevoerd op: 25/02/2018
Github commit:  COMMIT HASH

*  Verbinding topologie testen
    * PC1 moet kunnen pingen naar alle toestellen op het netwerk
       * PC2: 172.16.1.10
        * OK
       * PC3: 192.168.2.10
        * OK
       * R1: 172.16.3.1
        * OK
       * R2: 172.16.2.2
        * OK
       * R3: 192.168.1.1
        * OK
    * PC2 moet kunnen pingen naar alle toestellen op het netwerk
       * PC1: 172.16.3.10
        * OK
       * PC3: 192.168.2.10
        * OK
       * R1: 172.16.2.1
        * OK
       * R2: 172.16.1.1
        * OK
       * R3: 192.168.1.1
        * OK
    * PC3 moet kunnen pingen naar alle toestellen op het netwerk
       * PC1: 172.16.3.10
        * OK
       * PC2: 172.16.1.10
        * OK
       * R1: 172.16.2.1
        * OK
       * R2: 192.168.1.2
        * OK
       * R3: 192.168.2.1
        * OK
    
