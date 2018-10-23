#!/bin/bash

#Shell leegmaken
clear
#Nagaan of het bestand info.txt bestaat, zo niet gaat het script verder met de installatie van lamp
if [ -f "/home/vagrant/info.txt" ]; then
#Melding als info.txt bestaat
echo "LAMP is already installed";
else

#Installatie van LAMP
## Httpd installatie, -y voor assume yes -q for quiet
echo "Installing LAMP please wait..."
## Installatie mariadb-server, mariadb, php, ftp
sudo yum install httpd mariadb-server mariadb php vsftpd -y -q
## Installatie van php modules
sudo yum install php-pecl-mcrypt php-mysqlnd php-gd php-curl php-ldap php-zip php-fileinfo php-xml php-pdo -y -q
## Installatie van php 7.2
sudo yum install http://rpms.remirepo.net/enterprise/remi-release-7.rpm -y -q
sudo yum --enablerepo=remi-php72 install php -y -q
# Melding einde installatie core LAMP
echo "Done(1/5)"
echo ""


## Automatisch opstarten activeren van de service httpd en mariadb
echo "Enabling services httpd en mariadb..."
## Enablen van httpd (-q voor quiet)
sudo systemctl enable httpd -q
## Enablen van mariadb (-q voor quiet)
sudo systemctl enable mariadb -q
echo "Done(2/5)"
echo ""


echo "Starting services...(httpd, mariadb, vsftpd)"
## De service httpd, mariadb en vsftpd starten
sudo systemctl start httpd -q
sudo systemctl start mariadb -q
sudo systemctl start vsftpd -q
echo "Done(3/5)"
echo ""

echo "Configuring sql users and tables..."
#Set sql admin password
sudo mysqladmin password "root"


#SQL SCRIPT (MYSQL_SECURE_INSTALLATION) dit voert de initieële configuratie van SQL uit
mysql --user="root"  --password="root" --execute="DELETE FROM mysql.user WHERE User=''; DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1'); DROP DATABASE test;DELETE FROM mysql.db WHERE Db='test' OR Db='test\_%';FLUSH PRIVILEGES;"


#Random generatie van SQL wachtwoord voor gebruiker 'default'
pass=$(date +%s | sha256sum | base64 | head -c 12)

#Aanmaken van gebruiker 'default' met toegang van buiten de server (%)
mysql --user="root" --password="root" --execute="CREATE USER 'default'@'%' IDENTIFIED BY '$pass';"
echo "Done(4/5)"
echo ""


echo "Adding httpd(80), mariadb(3306) and vsftpd(22) to the firewall..."
## Firewall httpd, mariadb(3306) en vsftpd(25)
sudo firewall-cmd --zone=public --permanent --add-service=http -q
sudo firewall-cmd --zone=public --permanent --add-port=3306/tcp -q
sudo firewall-cmd --zone=public --permanent --add-port=22/tcp -q
## Herstarten firewall
sudo systemctl restart firewalld
echo "Done(5/5)"
echo ""



## Aanmaken van infobestand
echo "SQL INFORMATION" >> /home/vagrant/info.txt
echo "User: 'root'" >> /home/vagrant/info.txt
echo "Password: 'root'" >> /home/vagrant/info.txt
echo "The root user is only usable from localhost" >> /home/vagrant/info.txt
echo "" >> /home/vagrant/info.txt
echo "User: 'default'" >> /home/vagrant/info.txt
echo "Password: $pass" >> /home/vagrant/info.txt
echo "The default user is externally accessable" >> /home/vagrant/info.txt
echo "File info.txt created"
fi

#Controlleren ofdat drupal al geïnstalleerd is
if [ ! -d "/var/www/html/drupal" ]; then
echo ""

#Antwoord controlleren, doorgaan als antwoord = "", Y of y
if [ "$1" == "" ] || [ "$1" == "y" ] || [ "$1" == "Y" ]; then
echo "Installing Drupal please wait..."
#installation drupal

sudo yum install php-opache -y -q
#Download link van drupal
curl -so drupal.tar.gz https://ftp.drupal.org/files/projects/drupal-8.5.0.tar.gz
#Uitpakken van de map drupal naar de html map van httpd
sudo tar -xzf drupal.tar.gz -C /var/www/html
#Hernoemen van de map drupal-8.5.0 naar drupal zodat localhost/drupal mogelijk is
sudo mv /var/www/html/drupal-8.5.0 /var/www/html/drupal
#Verwijderen van het gedownloade bestand
sudo rm drupal.tar.gz
#Kopiëren van default configuratiebestand voor nieuwe installatie drupal
sudo cp /var/www/html/drupal/sites/default/default.settings.php /var/www/html/drupal/sites/default/settings.php
#Permissies voor drupal binnen de html map (a = access, w = write)
sudo chmod a+w -R /var/www/html/drupal
sudo chmod a+w /var/www/html/drupal/sites/default
sudo chmod a+w /var/www/html/drupal/sites/default/settings.php
#Change file security context naar httpd_sys_content_rw_t voor de drupal sites
sudo chcon -R -t httpd_sys_content_rw_t /var/www/html/drupal/sites
#Httpd herstarten
sudo systemctl restart httpd -q
echo "Done(1/1)"
fi
#Melding als drupal al geïnstalleerd is
else echo "Drupal is already installed."
fi


#Controlleren ofdat Wordpress al geïnstalleerd is
if [ ! -d "/var/www/html/wordpress" ]; then
echo ""
#Antwoord controlleren doorgaan als antwoord = "", Y of y
if [ "$2" == "" ] || [ "$2" == "y" ] || [ "$2" == "Y" ]; then
echo "Installing WordPress please wait..."
#Aanmaken database voor wordpress
mysql --user="root" --password="root" --execute="CREATE DATABASE wordpress; "
#Download link van WordPress (L voor location (als het bestand verplaatst is naar een nieuwe locatie), -O remote name, -s voor silent)
curl -LOs http://wordpress.org/latest.tar.gz
#Uitpakken van het tar.gz bestand naar /var/www/html (-x voor extract, -z voor filtering door gzip, -f voor file of archive , -C voor location waar bestand uitgepakt moet worden)
sudo tar -xzf latest.tar.gz -C /var/www/html
#Verwijderen van het gedownloade archief
sudo rm latest.tar.gz
#Permissies voor wordpress binnen de html map (a = access, w = write)
sudo chmod a+w /var/www/html/wordpress
sudo chmod a+w /var/www/html/wordpress/wp-config-sample.php
#Change file security context naar httpd_sys_content_rw_t voor de wordpress map
sudo chcon -R -t httpd_sys_content_rw_t /var/www/html/wordpress
echo "Done(1/1)"
fi
#Melding als wordpress al geïnstalleerd is
else echo "WordPress is already installed."
fi
