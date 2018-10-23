# Testplan SAP #

## Beschrijving

Dit is het testplan voor de SAP-server, momenteel wordt enkel de installatie van de Server en SAP ABAP 7.51 beschouwd in dit testplan.
Dit testplan kan worden gebruikt na het volgen van de installatiehandleiding voor SAP.
 
Requirements
---
- VirtualBox
- OpenSUSE
- SAP ABAP 7.51

## Controle installatie

* Controleer of na het uitvoeren van de installatie de juiste uitvoer werd gegeven.
    * Verwacht resultaat:`Instance on host vhcalnplci started` en `Installation of NPL succesful`
    * Hoe testen: Terminal (volgend op vorige stap) `ls-l install.sh`

* Controleer de opslagruimte
    * Verwacht resultaat: Minimaal een totale schrijfruimte van 100gb.
    * Hoe testen: Open Files en bekijk de Local Disk 


* Controleer de firewall
    * Verwacht resultaat: Firewall uitgeschakeld
    * Hoe testen: Terminal `sudo systemctl status SuSEfirewall2`


* Controleer de status van SSH
    * Verwacht resultaat: SSH ingeschakeld
    * Hoe testen: Terminal `sudo systemctl status ssh`


* Controleer de status van uuid (This daemon procd vides universal unique identifiers)
    * Verwacht resultaat: uuidd ingeschakeld
    * Hoe testen: Terminal `sudo systemctl status uuidd`


* Controleer of libaio geinstallerd is
    * Verwacht resultaat: return in deze vorm `libaio1 1-0.3.109-22.3x86_64`
    * Hoe testen: Terminal `rpm -qa | grep libaio`
   
* Controleer of de hostname correct is
    * Verwacht resultaat: return is `vhcalnplci`
    * Hoe testen: Terminal `hostname`


* Controleer of het ip adres juist gemapt is
    * Verwacht resultaat: lijn in return is `10.0.2.15 vhcalnplci vhcalnplci.dummy.nodomain`
    * Hoe testen: Terminal `sudo cat /etc/hosts`


* Controleer of de installatie bestanden beschikbaar zijn
    * Verwacht resultaat: folder /media/sf_s4installer is toegankelijk
    * Hoe testen: Terminal `sudo -i` + sudo password + `cd /media/sf_s4installer`


* Controleer of het install.sh (installatiescript) execute permissies heeft.
    * Verwacht resultaat: -rwxrwx---
    * Hoe testen: Terminal (volgend op vorige stap) `ls-l install.sh`
