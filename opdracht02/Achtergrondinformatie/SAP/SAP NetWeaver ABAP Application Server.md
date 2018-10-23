# Achtergrond informatie SAP NetWeaver ABAP Application Server #

## Introduction ##

SAP Web Application Server is een deel van SAP NetWeaver wat word gebruikt voor web application server voor SAP producten.

## Achterliggende artictuur ##

De onderliggende artictuur bestaat uit 5 delen.

   ### Presentation layer ###
   
    Persistence laag bestaat, de grafische interface kan ontwikkeld worden in Java Server Pages (JSP) , Web Dynpro technology , ...
   
   ### Business layer ###
      The business logica kan geschreven worden in ofwel ABAP of in een Java based programmeer taal die op de J2EE standard werkken. 
   
   ### Integration layer ###
      De local integration engine is een deel van de SAP Web AS en zorgt voor de de constante connectie naar de SAP XI ( of SAP PI ). en deze zorgt ook voor uitwisseling van berichtentussen componenten dat zijn geconnecteerdaan SAP XI.
   
   ### Connectivity layer ###
      Vertoond alle interface bevraging van in de uit de user interface, de mogelijke protocollen zijn: Hypertext Transfer Protocol (HTTP), HTTPS (deel van HTTP loopende in Secure Socket Layer (SSL)), Simple Mail Transfer Protocol (SMTP), Simple Object Access Protocol (SOAP), en Fast Common Gateway Interface (FastCGI).
   
   ### Persistence layer ###
      Hier ligt de de commictaie met de database, deze onderstuend ABAP omgeving door Open SQL, SQLJ, JDO, JDBC
      

## Stappenplan opzetten ##

*1 = Download de relevante ABAP download files (“abap.rar”) = https://tools.hana.ondemand.com/#abap  
*2 = Installeer de ABAP via de /install.sh commando


## Opstelling van SAP netweaver 7.51 op openSUSE  ##

Wij hebben het stappenplan vanuit onderstaande link gebruikt, hierbij zijn wij nog op enkele probkelen gestuit. Het installeren van de GuestAdditions in openSUSE was geen evidentie maar dit is opgelost. In de handleiding wordt ook het instellen van een proxy aangehaald dit is ons geval niet nodig. 

https://blogs.sap.com/2017/09/04/newbies-guide-installing-abap-as-751-sp02-on-linux/

## Ubunto ##
Week 12 maart
Ookal raden ze in elke tutorial aan om openSUSE te gebruiken, was er in ons team geen spraken van om dit te gebruiken.  
We besliste vrij snel om ubunto te gaan gebruikeren om dat we allen meer ervaring hebben met ubunto.  
De installatie van SAP op ubunto en de installatie op openSUSE verschilt toch een beetje van elkaar, openSUSE maakt gebruik van YaST een tool voor het instellen van hardware en software (zoals service's). Ubunto heeft dit niet, Vandaar moet je toch wat meer opzoekingswerk gaan doen om de vertaalslag tussen YaST en Ubunto techniek te maken. Deze vertaalslag bestaat vooral uit het downloaden via apt-get en verschillende config file's aanpassen. Daarbij moet je bij Ubunto een extra instalatie doen van csh.  

Week 19 maart
Na het verder bekijken van de werking en installatie van SAP op Linux hebben we er toch voor gekozen om openSUSE te gebruiken. De voornaamste reden hiervoor is dat openSUSE wordt aangeraden door SAP en hun support voor openSUSE duidelijk beschreven is.
## Uuidd  ##

De uuidd daemon moet je draaiende hebben om de SAP software te laten runnen op het systeem , via get-apt te downloaden daarna de services enablen en starten volstaat.  

## Installen van hostname en static ip-adress ##

In openSUSE is het instellen van een hostname en static ip-adress vrij gemakkelijk, in Ubunto is het niet onmogelijk, maar allesins moeilijker. Dit is hoe wij als team dit hebben ingesteld.
1) Via commando *hostname "naam"* ( of het aanpassen van de file /etc/hostname ) stel je de hostname van het systeem in we hebben in dit geval voor de hostname : "vhcalnpli" gekozen. Omdat verschillende officiële bronnen dat hadden aangeraden om eventueel problemen te voorkomen. Of dit ook met een andere hostname gaat lukken zonder problemen , kunnen we niet met zekerheid zeggen. Aangezien we uiteindelijk toch zijn overgeschakkeld op openSUSE hebben we dit niet uitvoerig getest.
2) Via het network venter kan je de optie voor het automatisch ipv4 address'en toekrijgen (via DHCP) uitschakelen, en een static ip address zelf opgeven.  Opnieuw hebben we gekozen voor iets dat ze ons aanraden om te gebruiken namelijk het ip address 10.0.2.15/8
3) Je moet ook het net geconfiguurd ip address ook nog even toevoegen aan de /etc/hosts file. dit doe je met de lijn 10.0.0.15 vhcalnpli.dummy.nodomain vhcalnpli. (Ook aangeraden via internet)
4) Je moet er zeker van zijn dat de timezone staat op UCT. Dit doe je door het commando *sudo timedatectl set-timezone Etc/UTC*
5) De machine herstarten is een vereiste.

## Het verschil tussen versie 7.50 an 7.51 ##

SAP heeft verschillende versies van de Netweaver 7.50 en 7.51. Het verschil is dat Versie 7.50 SAP SLT ondersteund en 7.51 niet, Dus als u SAP SLT erbij wilt, moet de de versie 7.50 instaleren. De moeilijkheid voor de instalaties van SAP 7.50 is dat de licentie al is vervallen, hoe u deze moet herinstellen vind u door het downloaden van de volgende bestanden = *https://sap.sharepoint.com/sites/101566/Shared%20Documents/Forms/AllItems.aspx?id=%2Fsites%2F101566%2FShared%20Documents%2FASE%20Licenses_2019%2Ezip&parent=%2Fsites%2F101566%2FShared%20Documents&p=true&slrid=379e559e-30cb-5000-270b-b4da4fa22cf4* Als u niet persé SAP SLT nodig heeft wordt er aangeraden om versie 7.51 te downloaden. Deze licentie zal eind maart vervallen.

## bronnen en rescourse ##
* https://en.wikipedia.org/wiki/SAP_NetWeaver
* https://blogs.sap.com/2017/09/04/newbies-guide-installing-abap-as-751-sp02-on-linux/


* https://store.sap.com/sap/cp/ui/resources/store/html/SolutionDetails.html?pid=0000014493&catID=&pcntry=DE&sap-language=EN&_cp_id=id-1477346420741-0
* https://blogs.sap.com/2017/09/04/newbies-guide-installing-abap-as-751-sp02-on-linux/
* https://blogs.sap.com/2017/09/04/sap-as-abap-7.51-sp2-developer-edition-to-download-concise-installation-guide/
* https://blogs.sap.com/2016/11/03/sap-nw-as-abap-750-sp02-developer-edition-to-download/?preview_id=391853
* https://blogs.sap.com/2013/05/16/developer-trial-editions-sap-netweaver-application-server-abap-and-sap-business-warehouse-powered-by-sap-hana/
* http://www.sapyard.com/minisap-installation-part-1/
* https://www.sap.com/developer/trials-downloads.html
* https://help.sap.com/viewer/bcb0c0752eac4d269c85dc694050df13/16.0.2.1/en-US/a6a44386bc2b1014bba7d72e4e78fbde.html
* https://askubuntu.com/questions/250775/how-do-i-turn-off-the-firewall-in-ubuntu-12-04/250801
* https://askubuntu.com/questions/767045/how-to-check-computers-timezone-through-terminal
* https://askubuntu.com/questions/323131/setting-timezone-from-terminal/323163
* https://archive.sap.com/discussions/thread/3533538
* https://blogs.sap.com/2017/09/04/newbies-guide-installing-abap-as-751-sp02-on-linux/
