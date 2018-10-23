# LAMP #

LAMP is een acroniem voor een set van gratis vrije softwarepakketten, die gaan vaak samen gebruikt worden om websites te draaien op het internet.

## Acroniem ##

 bestaat uit 3 belangrijke delen
  1) webserverinfrastructuur ( = is een programma die er voor zorgt dat je verzoeken van een client kan verwerken en hem kunt geven wat ze nodig hebben, de 3 meeste gebruikte zijn : Apache, IIS en nginx = deze worden ook wel vaker webservers genoemd )
  2) Programmeerparadigma ( = een bepaalde manier waarop je code schrijft. voorbeelden hiervan zijn : Imperatief programmeren , Functioneel programmeren , Logisch programmeren , Objectgeoriënteerd programmeren sommige programmeertalen kunnen slechts één van deze Programmeerparadigma aan, bij andere kan je kiezen wat je gaat doen.
  3) softwaredistributiepakket
  
## Linux ##

De L staat voor Linux dat betekend dat een LAMP altijd op een besturingssyteem van linux zal draaien.

## Apache HTTP Server ##

De A staat voor Apache is een opensource websever zowel voor linux als voor windows en andere UNIX-atige besturingsystemen. Apache word ook wel eens httpd genoemd. httpd of Apache is zeer populaire. Zo wordt het gebruikt door 64% van alle geregistreerde Belgische domeinen, daarbij kan je het ook gebruiken als een threaded webserver.

De service httpd maakt gebruik van de poort 80, deze zal u dan ook moeten opstellen op de server.

## MariaDB of MySQL ##

dit zijn bijde databasemagament systemen

### MariaDB ###

MariaDB is een relationeel databasemanagementsysteem (RDBMS). En is ontstaan door een fork van Mysql, hierdoor is het grotendeels compatibel met MySQL. MariaDB is geschreven in C++,C# en perl

#### Instalatie ####

De instalatie gebeurd uiteraard met een YUM install commando (Zoals hier verder uitgelegt), na het enable van de service, en de juiste poort (3306) open te zetten. Moet u ervoor zorgen dat u een secure installation maakt voor deze service's. Dit doet u met het commando mysql_secure_installation. als u dit doet zal u merken dat er veel user input word gevraagd van de gebruiker. Als u een standaart volledige automatisch systeem wilt maken. Kan dat op verschillende methode's hieronder een oplijsting van verschillende methodes.

##### Expect #####

De service expect maakt het mogelijk om standaard input te geven op vragen die je van het systeem krijgt. Door deze techniek toetepassen kan je heel makkelijk een standaart en default sql server op te stellen. Expect werkt op deze manier  

"spawn mysql_secure_installation" >> geeft aan waar je begind.  
"expect \string\" >> geeft aan wat je verwacht, wat de vraag is van het systeem.  
"send \"$MYSQL\r\"" >> geeft aan wat je reageert als gebruiker.  

Zoals u zelf wel al merkt is dit geen performate methode, vooral niet naar toekomstige updates toe, de kans dat de vragen vanuit het systeem veranderen is reële waardoor het script op termijn niet meer zal werken. Zoals Van Vreckem in *referentie1* al vermeld heeft is dit niet de manier waarop u dit zou moeten automatizeren.

##### SQL statements #####

De tweede en meteen de laaste methode die we gaan bespreken is gebruik maken van SQL statements om de database te creeën.
De stappen die je moet zetten gaat als volgt.
1) Het instellen van een root password voor de database
2) Delete anonieme gebruikers
3) Zorg ervoor dat de root gebruiker niet remotely kan inloggen
4) Verwijderen van de de test DB
5) Flush de privileges tables
6) Voeg een nieuwe gebruiker toe

### MySQL ###

Is een opensource relationele database ontwikkeld door	Oracle Corporation, en is een veel gebruikte relationeel databasemanagementsysteem (RDBMS). De naam is een combinatie van "my" ( de naam van het dochtertje van een medeoprichter ) en SQL (Structured Query Language).
Dit wordt veel gebruikt in combinatie met PHP ( Hypertext Preprocessor ), heeft onderandere een MySQL-frontend phpMyAdmin systeem en een webgebaseerd MySQL-beheerprogramma geschreven in PHP en MySQL Workbench.

## PHP, Perl, en/of Python ##

Dit zijn de programmerentalen die worden gebruikt in een LAMP

### PHP ###

PHP of Hypertext Preprocessor word gebruikt voor dynamische webpagina's te creeën,  deze is ontworpen door een senior softwareontwikkelaar bij IBM. De Paradigma	is ofwel Imperatief of Objectgeoriënteerd.

### Perl ###

Perl is een programmeertaal ontworpen door Larry Wall die eigenschappen van C en UNIX-scripttalen zoals sh, sed en awk in zich verenigt. De afkorting Perl staat voor Practical Extraction and Report Language. Dit is een multi-paradigma.

### Python ###

Python is een programmeertaal die begin jaren 90 ontworpen en ontwikkeld werd door Guido van Rossum.
De taal is mede gebaseerd op inzichten van professor Lambert Meertens die een op BASIC gebaseerde taal genaamd ABC had ontworpen, maar dan met allerlei zeer geavanceerde datastructuren. Inmiddels wordt de taal doorontwikkeld door een enthousiaste groep. Deze is ook opensource.


## YUM ##

Wat is YUM nu eigenlijk, YUM is een standaard tool die het mogelijk om zaken te kunnen downloaden, verwijderen, Pakketen of programma's te beheren, je kan er nog vele andere zaken mee (zie *referentie2* ). YUM wordt gebruikt op redhead, centos

## Drupal ##

Drupal is een CMS, ontwikkeld in de programmeertaal PHP. Drupal wordt gebruikt om websites en webblogs te beheren. Drupel draait op lunix , macOS en windows. Drupel word gezien als de op de één na beste CMS systeem na Joomla!. De installatie van druple moet je er voor zorgen dat de gebruikers gebruik kunnen maken de achterliggende database, dit is zeer belangrijk. Ook zul je zaken van rechtten tot bepaalde mappen moeten aanpassen (meer hierover in de handleiding)

## Wordpress ##

WordPress is vrije webblog-software, en wordt door een flinke groep ontwikkelaars ondersteund. WordPress is het meest gebruikte contentmanagementsysteem. Daarbij maakt het gebruik van de programmeertaal PHP. Bij de installatie van de wordpress is belangrijk om eerst eeen database te maken. En later Intestellen bij de configuratie van de wordpress ( meer hierover bij de handleiding)

## Referenties ##
1) http://bertvv.github.io/notes-to-self/2015/11/16/automating-mysql_secure_installation/
2) https://access.redhat.com/sites/default/files/attachments/rh_yum_cheatsheet_1214_jcs_print-1.pdf


## Bronnen ##

https://nl.wikipedia.org/wiki/LAMP
https://nl.wikipedia.org/wiki/Linux
https://nl.wikipedia.org/wiki/Apache_(webserver)
https://nl.wikipedia.org/wiki/MariaDB
https://nl.wikipedia.org/wiki/MySQL
https://nl.wikipedia.org/wiki/PHP
https://nl.wikipedia.org/wiki/Perl_(programmeertaal)
https://nl.wikipedia.org/wiki/Python_(programmeertaal)
https://wiki.centos.org/
http://bertvv.github.io/notes-to-self/2015/11/16/automating-mysql_secure_installation/
https://www.digitalocean.com/community/tutorials/how-to-install-linux-apache-mysql-php-lamp-stack-on-centos-7
https://unix.stackexchange.com/questions/374591/mysql-automation-through-expect/374623
https://stackoverflow.com/questions/18044771/how-to-escape-unusual-uniq-characters-from-expect-scripts
https://stackoverflow.com/questions/8352851/how-to-call-shell-script-from-another-shell-script
https://stackoverflow.com/questions/33362904/completely-remove-mariadb-or-mysql-from-centos-7-or-rhel-7
https://linux.die.net/man/1/expect
https://stackoverflow.com/questions/4780893/use-expect-in-bash-script-to-provide-password-to-ssh-command
https://tecadmin.net/remove-mysql-completely-from-linux-system/7
https://gist.github.com/fernandoaleman/2172388
https://www.howtogeek.com/howto/30184/10-ways-to-generate-a-random-password-from-the-command-line/
https://access.redhat.com/solutions/9934
https://github.com/jrcharney/rigel/wiki/Download-using-curl-and-tar
https://www.digitalocean.com/community/tutorials/how-to-install-drupal-on-a-virtual-server-running-centos-6--2
https://nl.wikipedia.org/wiki/Drupal
https://www.digitalocean.com/community/tutorials/how-to-install-wordpress-on-centos-7


