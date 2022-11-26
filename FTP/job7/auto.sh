#! /bin/bash

sudo apt install proftpd-* -y
sudo apt install openssl -y

sudo groupadd ftpgroup
cd /etc/proftpd
sudo mkdir ssl

sudo cat /home/kenza/job7/conf.proftpd > /etc/proftpd/proftpd.conf
sudo cat /home/kenza/job7/conf.tls > /etc/proftpd/tls.conf
sudo cat /home/kenza/job7/conf.modules > /etc/proftpd/modules.conf
	echo -e "\e[0;36m Les configurations ont été \e[0m \e[0;31m modifiée \e[0m"

sudo openssl req -new -x509 -keyout /etc/proftpd/ssl/proftpd.key.pem -days 365 -nodes -out /etc/proftpd/ssl/proftpd.cert.pem

sudo chmod 640 /etc/proftpd/ssl/proftpd.cert.pem
sudo chmod 600 /etc/proftpd/ssl/proftpd.key.pem
sudo systemctl restart proftpd.service


