#!/bin/bash

#Install PHP and HTTPD service
yum install -y http://mirror.centos.org/centos/7/extras/x86_64/Packages/centos-release-scl-rh-2-3.el7.centos.noarch.rpm
нгь

systemctl start rh-php72-php-fpm

#Make HTTPD to start on boot.
chkconfig httpd on

#Start HTTPD service
/etc/init.d/httpd start



#Install zip and unzip commands
yum install zip unzip -y
cd /var/www/html
wget https://wordpress.org/latest.zip
unzip latest.zip
mv wordpress/* .
rm -rf wordpress
chown ec2-user:apache /var/www/html -R
chmod 2775 /var/www/html -R
rm -f latest.zip
