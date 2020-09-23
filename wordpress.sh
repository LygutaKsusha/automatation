#!/bin/bash

#Install PHP and HTTPD service
yum install php7.1-pdo php7.1-mcrypt php7.1-mbstring php7.1-mysqlnd php7.1-curl php7.1-intl php7.1-cli php7.1-common php7.1-opcache
php7.1-readline php7.1-json php7.1 httpd24-devel httpd24-tools httpd24 -y

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
