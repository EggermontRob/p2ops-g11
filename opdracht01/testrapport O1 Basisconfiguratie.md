# Testrapport taak 1: 

(Een testrapport is het verslag van de uitvoering van het testplan door een teamlid (iemand anders dan de auteur van het testplan!). Deze noteert bij elke stap in het testplan of het bekomen resultaat overeenstemt met wat verwacht werd. Indien niet, dan is het belangrijk om gedetailleerd op te geven wat er misloopt, wat het effectieve resultaat was, welke foutboodschappen gegenereerd werden, enz. De tester kan meteen een Github issue aanmaken en er vanuit het testrapport naar verwijzen. Wanneer het probleem opgelost werdt, wordt een nieuwe test uitgevoerd, met een nieuw verslag.)



```
Testplan taak: opdracht-01-Packettracer - basisconfiguratie Switch
Auteur(s) testplan: De Cock Robin 
Uitvoering Labo: De Cock Robin,Vandeveire Thomas Tester:

Stappenplan

Verbinding topologie testen
ping van de ééne pc naar de andere pc
bekijk of de ip adressen van de bijde pc , en de Vlan's juist zijn
controleer of de 2 switchs elkaar kennen
Configuratie Switches
8ubRu is het passwoord voor alle lines, contoleer of deze over zijn ingschakkeld en juist zijn.
exec passwoord C9WrE, contoleer of deze over zijn ingschakkeld en juist zijn.
contoleer of deze zijn geencrypt zijn
bekijk of er een message-of-the-day (MOTD) Banner is ingesteld
```

## Test 1

Uitvoerder(s) test: Ismail El Kaddouri
Uitgevoerd op: 25/02/2018
Github commit:  COMMIT HASH



Resultaat: 
* verbinding topologie
  ** ping van student2 naar student 1 ==> OK
  ** ping van student1 naar student 2 ==> OK
  
* Configuratie
  ** student1 ==> OK
  ** student2 ==> OK
  ** Class-A (show running-config) ==> OK
  ** Class-B (show running-config) ==> OK
  
  
  
