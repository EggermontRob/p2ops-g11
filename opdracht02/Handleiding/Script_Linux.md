
# Stappenplan script LAMP stack
## Installatie LAMP ##

1. Bij de start van het script controlleert het script of de installatie van LAMP al reeds voltooid is. Hiervoor kijkt het script ofdat het bestand info.txt bestaat.
      * if [ -f "info.txt" ]; then

2. Voor de installatie van LAMP voert het script de volgende commando's uit voor de installatie van httpd, mariadb, php7.2 en vsftpd (ftp server voor het uploaden van bestanden naar de webserver)
      * sudo yum install httpd mariadb-server mariadb php vsftpd -y -q  
      * sudo yum install http://rpms.remirepo.net/enterprise/remi-release-7.rpm -y -q
      * sudo yum --enablerepo=remi-php72 install php -y -q
      
3. Installatie van PHP modules
      * sudo yum install php-mcrypt php-mysql php-cli php-gd php-curl php-ldap php-zip php-fileinfo php-xml php-opache php-pdo -y -q  

4. Na de instalatie van de LAMP stack gaan we de services httpd en mariadb enablen. Hierdoor worden deze services opgestart bij het opstarten van het besturingssysteem.
      * sudo systemctl enable httpd mariadb -q

5. De volgende services worden gestart: httpd , mariadb en vsftpd.
      * sudo systemctl start httpd, mariadb, vsftpd

6. Na de installatiestappen gebeurd de configuratie van de database, in dit geval MariaDb. Het script begint met het instellen van een root password, Het script kiest het root wachtwoord 'root'.  
      * sudo mysqladmin password "root"  

7. Vervolgens gaat het script de standaard configuratie aanpassen van mariadb. Hiervoor moet het script eerst inloggen op de database met het vooraf ingestelde root wachtwoord. Anonymous login wordt verwijderd, externe root toegang wordt uitgeschakeld, De database test wordt verwijderd en dan uiteindelijk wordt FLUSH PRIVILEGES uitgevoerd.
      * mysql --user="root"  --password="root" --execute="DELETE FROM mysql.user WHERE User=''; DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1'); DROP DATABASE test;DELETE FROM mysql.db WHERE Db='test' OR Db='test\_%';FLUSH PRIVILEGES;"

8. De standaardconfiguratie is doorgevoerd en nu gaat het script de gebruiker 'default' aanmaken met een willekeurig gegenereerd wachtwoord. Deze gebruiker heeft externe toegang tot de database.
      * pass=$(date +%s | sha256sum | base64 | head -c 12)
      * mysql --user="root" --password="root" --execute="CREATE USER 'default'@'%' IDENTIFIED BY '$pass';"

9. Om toegang tot de services te krijgen gaat het script toegang geven tot de database. De poorten worden opengezet voor httpd, mariadb en ftp. Als dit gebeurd is wordt de firewall herstart zodat deze rules toegepast worden.
      * sudo firewall-cmd --zone=public --permanent --add-service=http -q
      * sudo firewall-cmd --zone=public --permanent --add-port=3306/tcp -q
      * sudo firewall-cmd --zone=public --permanent --add-port=25/tcp -q
      * sudo systemctl restart firewalld

10. Na het uitvoeren van de vorige stappen gaat het script een info.txt bestand aanmaken. Hierin vindt u de login gegevens van mariadb voor de gebruiker 'root' en 'default'. Dit bestand is enkel raadpleegbaar nadat het script uitgevoerd is
      * echo "User: 'default'" >> info.txt
      * echo "Password: $pass" >> info.txt

## Installatie Drupal ##

1. Nu de installatie van LAMP klaar is controleert het script of Drupal al reeds geïnstalleerd is.
      - if [ ! -d "/var/www/html/drupal" ]; then
      
2. Als aan de bovenste voorwaarde voldaan wordt dan vraagt het script of de gebruiker Drupal wilt installeren.
      - echo "Do you want to install Drupal on this server?[Y/n]"
      
3. Als niet aan de bovenste voorwaarde voldaan wordt dan krijgt de gebruiker een melding.
      - else echo "Drupal is already installed."
      
4. Het script leest het antwoord en slaat dit op in een variabele 'answer'
      - read answer
      
5. De variabele 'answer' wordt gecontrolleerd naar het voorkomen van "", "y" of "Y". Als de waarde van 'answer' niet gelijk is aan voorgaande tekens dan wordt de installatie van Drupal overgeslagen.
      - if [ "$answer" == "" ] || [ "$answer" == "y" ] || [ "$answer" == "Y" ]; then  
      
6. De gebruiker heeft gekozen voor de installatie van Drupal. Het script gaat de php extensie opcache installeren en gaat vervolgens het gecomprimeerde bestand van drupal downloaden.
      - sudo yum install php-opcache -y -q
      - curl -so drupal.tar.gz https://ftp.drupal.org/files/projects/drupal-8.5.0.tar.gz
      
7. Het gedownloade bestand wordt uitgepakt naar de map /var/www/html en wordt vervolgens hernoemd naar drupal zodat de gebruiker kan navigeren naar de configuratie van Drupal door het volgende in de adresbalk te typen: xxx.xxx.xxx.xxx/drupal
      - sudo tar -xzf drupal.tar.gz -C /var/www/html
      - sudo mv /var/www/html/drupal-8.5.0 /var/www/html/drupal
      
8. Het script gaat nu het gedownloade bestand verwijderen. Vervolgens wordt de default config ingeladen
     - sudo rm drupal.tar.gz
     - sudo cp /var/www/html/drupal/sites/default/default.settings.php /var/www/html/drupal/sites/default/settings.
     
9. Om de configuratie van Drupal mogelijk te maken worden er door het script permissies geconfigureerd. de access en write permissies worden gegeven aan de map drupal. de file security context wordt gewijzigd naar 'httpd_sys_content_rw_t' voor de map /var/www/html/drupal/sites.
      - sudo chmod a+w -R /var/www/html/drupal
      - sudo chcon -R -t httpd_sys_content_rw_t /var/www/html/drupal/sites
      
10. De service httpd wordt herstart om Drupal te activeren (-q voor quiet).
      - sudo systemctl restart httpd -q
      
11. De gebruiker krijgt een melding als de installatie voltooid is
      - echo "Done(1/1)"
      
## Installatie WordPress ##
1. De gebruiker kan ook kiezen voor WordPress. Het script controleert of WordPress al reeds geïnstalleerd is
      - if [ ! -d "/var/www/html/wordpress" ]; then
      
2. Als aan de bovenste voorwaarde voldaan wordt dan vraagt het script of de gebruiker WordPress wilt installeren.
      - echo "Do you want to install WordPress on this server?[Y/n]"
      
3. Als niet aan de bovenste voorwaarde voldaan wordt dan krijgt de gebruiker een melding.
      - else echo "WordPress is already installed."
      
4. Het script leest het antwoord en slaat dit op in een variabele 'answer2'
      - read answer2
      
5. De variabele 'answer2' wordt gecontrolleerd naar het voorkomen van "", "y" of "Y". Als de waarde van 'answer2' niet gelijk is aan voorgaande tekens dan wordt de installatie van WordPress overgeslagen en eindigt het script.
      - if [ "$answer2" == "" ] || [ "$answer2" == "y" ] || [ "$answer2" == "Y" ]; then
      
6. De gebruiker heeft gekozen voor de installatie van WordPress. Het script maakt een database aan voor WordPress en download het gecomprimeerde bestand van WordPress.
      - mysql --user="root" --password="root" --execute="CREATE DATABASE wordpress; "
      - curl -LOs http://wordpress.org/latest.tar.gz
      
7. Het gedownloade bestand wordt uitgepakt naar de map /var/www/html
      - sudo tar -xzf latest.tar.gz -C /var/www/html
      
8. Het script gaat nu het gedownloade bestand verwijderen.
      - sudo rm latest.tar.gz
      
9. Om de configuratie van WordPress mogelijk te maken worden er door het script permissies geconfigureerd. de access en write permissies worden gegeven aan de map wordpress en aan het standaard configuratiebestand. de file security context wordt gewijzigd naar 'httpd_sys_content_rw_t' voor de map /var/www/html/wordpress.
      - sudo chmod a+w /var/www/html/wordpress
      - sudo chmod a+w /var/www/html/wordpress/wp-config-sample.php
      - sudo chcon -R -t httpd_sys_content_rw_t /var/www/html/wordpress
      
10. De gebruiker krijgt een melding als de installatie voltooid is
      - echo "Done(1/1)"   
         
