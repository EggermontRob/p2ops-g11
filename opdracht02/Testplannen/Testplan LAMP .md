# Testplan LAMP

Beschrijving
---
Dit is het testplan voor de lamp-server met Drupal en Wordpress mogelijkheid. De installatie van de CentOS distributie gebeurt via Vagrant waarna onmiddelijk het installatie script voor LAMP wordt uitgevoerd. De gebruiker kan de keuzes voor Drupal en Wordpress maken onmiddelijk na het aanroepen van de vagrant box. 

De credentials voor de database kan men terugvinden in het info.txt bestand, dat men kan vinden na het uitvoeren van het script vinden in de home directory van de gebruiker vagrant (/home/vagrant) op de virtuele machine

Requirements
---
- VirtualBox
- Vagrant

Stappenplan
---
## 1. Vagrant 

### Uit te voeren stappen
De vagrant file moet worden gedownload vanuit de Github repository  [VagrantFile](https://github.com/HoGentTIN/p2ops-g11/blob/master/opdracht02/Scripts/WISA/Vagrantfile "VagrantFile") als ook het script LAMP.sh.
Deze moeten beide in dezelfde directory geplaatst worden. 

- Opstarten Terminal/Powershell
- navigeer naar de folder waar je het bovenstaand bestanden hebt gedownload
- voer daar dan het commando `vagrant up`
-  Dit zal nu enige tijd in beslag nemen

### Verwacht resultaat
Er zou nu een nieuwe virtuele machine moeten staan bij je VM's in VirtualBox met de naam `LAMP CLI` als men deze opstart zou het script al uitgevoerd moeten zijn.  

## 2. Daemons / WebApplicaties

De active services controleren:  
Services kunnen worden getest met het commando: ```systemctl status %servicename%```
- httpd (Apache)  
- vsftpd (FTP)  
	* Hier kan men ook via een FTP tool, een site publiceren (bv. via FileZilla een html/css site publiceren)
- mariadb (MySQL)  
	* Mogelijkheid om het te testen kan dit lokaal vanuit de machine naar SQL Management Studio  
	
	* Of via een commando  

	```mysql --user="root" --password="root" --execute="QUERY"```

## 3. Software indien gekozen
- drupal 
	- Dit door naar het webadres van de server te gaan (xxx.xxx.xxx.xxx/drupal)
- Wordpress 
	- Dit door naar het webadres van de server te gaan (xxx.xxx.xxx.xxx/wordpress)
