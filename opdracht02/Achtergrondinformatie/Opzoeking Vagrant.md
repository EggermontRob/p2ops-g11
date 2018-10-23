# Vagrant opzoekingen

## setting up a CentOS terminal server 

* Installeren CentOS 
vagrant init edtoktay/centos7
vagrant up

login: root
password: vagrant

* Installeren W2016
vagrant init mwrock/Windows2016
vagrant up

## Het opzetten van een vagrant box
### Vargant app informatie
Link: https://app.vagrantup.com
Username: rob.eggermont@hotmail.com  
Password: Projecten2  
### Requiremetns
* VirtualBox Guest Additions installed
### Syntax
Voorbeeld windows script
```ruby
# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "EggermontRob/WISA"
  config.vm.communicator = "winrm"
  config.winrm.username = "Administrator"
  config.winrm.password = "Projecten2"
   config.vm.provider "virtualbox" do |vb|
     vb.memory = "2048"
     vb.name = "WISA CLI"
   end
   config.vm.provision "shell", path: "http://db.ident-it.be/wisa/wisa.ps1", privileged: true
end
```
* config.vm.box -> Geeft aan welke vagrant box er gedownload moet worden
* config.cm.communicator -> Geeft aan of er ssh of winrm moet gebruikt worden. Standaard wordt ssh gekozen
* congif.vm.poridor.memory -> Ramgeheugen dat wordt toegewezen aan de virtuele machine
* config.vm.providor.name -> Naam die wordt getoond in virtualbox
* config.vm.provision -> Het script dat moet worden uitgevoerd

Bronnen:  
https://app.vagrantup.com/edtoktay/boxes/centos7  
https://drupalize.me/videos/installing-vagrant-and-virtualbox?p=1526    
http://bertvv.github.io/notes-to-self/2015/10/05/one-vagrantfile-to-rule-them-all/
