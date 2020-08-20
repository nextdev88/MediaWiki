#!/bin/bash
yum install git -y
yum install wget -y
yum install dnf -y
dnf install httpd php php-mysqlnd php-gd php-xml mariadb-server mariadb php-mbstring php-json -y

systemctl start httpd
systemctl start mariadb

cd /apps

git clone https://github.com/nextdev88/MediaWiki.git
chmod 777 . -R
cd MediaWiki


mysql -u root < db.sql

wget https://releases.wikimedia.org/mediawiki/1.34/mediawiki-1.34.2.tar.gz
wget https://releases.wikimedia.org/mediawiki/1.34/mediawiki-1.34.2.tar.gz.sig
#gpg --verify mediawiki-1.34.2.tar.gz.sig mediawiki-1.34.2.tar.gz

cd /var/www
tar -zxf /apps/MediaWiki/mediawiki-1.34.2.tar.gz
ln -s mediawiki-1.34.2/ mediawiki

rm -rf /etc/httpd/conf/httpd.conf
cp -rnf /apps/MediaWiki/httpd.conf /etc/httpd/conf

systemctl restart httpd
