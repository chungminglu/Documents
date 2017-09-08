#!/bin/bash
#install Spark on CentOS 7

## install java
cd /home/minglu
wget http://ftp.wsisiz.edu.pl/pub/pc/pozyteczne%20oprogramowanie/java/jdk-8u144-linux-x64.rpm
sudo rpm -ivh /home/minglu/jdk-8u144-linux-x64.rpm
rm /home/minglu/jdk-8u144-linux-x64.rpm

##install scala

yum install wget -y
wget http://downloads.typesafe.com/scala/2.11.11/scala-2.11.11.tgz
tar xvf scala-2.11.11.tgz

#install spark

wget http://d3kbcqa49mib13.cloudfront.net/spark-2.2.0-bin-hadoop2.7.tgz
tar xvf spark-2.2.0-bin-hadoop2.7.tgz

##開啟port
firewall-cmd --permanent --zone=public --add-port=6066/tcp
firewall-cmd --permanent --zone=public --add-port=7077/tcp
firewall-cmd --permanent --zone=public --add-port=8080-8081/tcp
firewall-cmd --reload



echo 'export SCALA_HOME=/home/minglu/scala-2.11.11' >> /etc/profile
echo 'export PATH=$SCALA_HOME/bin:$PATH' >> /etc/profile
echo 'export SPARK_HOME=/home/minglu/spark-2.2.0-bin-hadoop2.7' >> /etc/profile
echo 'export PATH=$SPARK_HOME/bin:$PATH' >> /etc/profile
source /etc/profile


java -version
scala -version
