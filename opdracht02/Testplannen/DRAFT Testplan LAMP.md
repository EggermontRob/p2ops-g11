# Testplan LAMP

1. Vagrant box downloaden 
	Verwacht resultaat: Nieuwe VirtualBox die opstart met CentOS
2. Services bekijken: httpd , mariadb , php ,ftp met commando "systemctl -a"	
	Verwacht resultaat: Als men in de services kijkt moet men deze services zien staan in start!
3. Login credentials terugvinden in ~/config.txt
	Verwacht resultaat: Daar kan je gebruikersnaam, wachtwoord van de root , en default gebruiker met een gegenereerd passwoord. 
4. Website publiceren via een FTP programma (bv. FileZilla) en dan raadplegen.
	Verwacht resultaat: dat men de gepubliceerde bestanden kan raadplegen via het localip van de virtualbox
