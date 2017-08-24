#!/bin/bash

#This file will backup 
#       1. username (in /etc, passwd, shadow, group, gshadow, aliases, 
#          aerosol510.mail, and /var/spool/mail, total 7 files) 
#       2. httpd (in /etc/httpd/conf, httpd.conf and /var/www/html 
#          /home/vbird will be tared !) 
#       3. smb (in /etc/samba/*, all files will be copied!) 
#       4. The safe and driver files 
#          /etc files 
#          /var/lib/mysql 
# 
# =========================================================================== 
# History 
# Make by VBird 2000/12/16 first time! 
# ============================================================================
# 建立備份的路徑！這樣的好處是可以清楚的知道每個檔案放置的地點！ 
usernamep=/disk2/backup/username 
httpdp=/disk2/backup/httpd 
smbp=/disk2/backup/smb 
otherp=/disk2/backup/others 
netpara=/disk2/backup/network 
ftpp=/disk2/backup/ftp

#1. username, sendmail and their home directories and local setting 
cp /etc/passwd $usernamep 
cp /etc/shadow $usernamep 
cp /etc/group $usernamep 
cp /etc/gshadow $usernamep 
cp /etc/aliases $usernamep 
tar -zcf $usernamep/mail.tar.gz /var/spool/mail 
tar -zcf $usernamep/home.tar.gz /home 
tar -zcf $usernamep/usr.local.tar.gz /usr/local

#2. httpd and mysql and counter data 
cp /etc/httpd/conf/httpd.conf $httpdp 
tar -zcf $httpdp/webcgi.tar.gz /var/www 
tar -zcf $httpdp/counter.tar.gz /usr/local/Counter/data 
/etc/rc.d/init.d/mysqld stop 
tar -zcf $httpdp/mysql.lib.tar.gz /var/lib/mysql 
/etc/rc.d/init.d/myslqd start

#3. smb 
cp /etc/samba/lmhosts $smbp 
cp /etc/samba/MACHINE.SID $smbp 
cp /etc/samba/smb.conf $smbp 
cp /etc/samba/smbpasswd $smbp 
cp /etc/samba/smbusers $smbp

#4. safe and drivers 
tar -zcf $otherp/etc.tar.gz /etc 
tar -zcf $otherp/mrtg.cfg.tar.gz /usr/local/mrtg-2/bin 
tar -zcf $otherp/virus.tar.gz /usr/local/virus 
cp /etc/cron.weekly/backup /$otherp

#5. network parameters 
cp /etc/hosts           $netpara 
cp /etc/hosts.allow     $netpara 
cp /etc/hosts.deny      $netpara 
cp /etc/sysconfig/network               $netpara 
cp /etc/modules.conf                    $netpara 
cp /etc/sysconfig/network-scripts/ifcfg-eth0    $netpara

#6. ftp services 
cp /etc/ftp*    $ftpp
