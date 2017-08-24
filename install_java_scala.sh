#!/bin/bash
#install Spark on CentOS 7

## install java
cd /tmp
wget http://ftp.wsisiz.edu.pl/pub/pc/pozyteczne%20oprogramowanie/java/jdk-8u131-linux-x64.rpm
rpm -ivh /tmp/jdk-8u131-linux-x64.rpm
rm /tmp/jdk-8u131-linux-x64.rpm
## append /etc/profile 

export JAVA_HOME=/usr/java/java >> /etc/profile
export JRE_HOME=$JAVA_HOME/jre  >> /etc/profile
export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar:$JRE_HOME/lib/rt.jar  >> /etc/profile
export PATH=$PATH:$JAVA_HOME/bin  >> /etc/profile

source /etc/profile
java -version

yum install wget -y
wget http://downloads.typesafe.com/scala/2.11.11/scala-2.11.11.tgz
tar xvf scala-2.11.11.tgz
sudo mv scala-2.11.11 /usr/lib
sudo ln -s /usr/lib/scala-2.11.11 /usr/lib/scala
export PATH=$PATH:/usr/lib/scala/bin >> /etc/profile
source /etc/profile
scala -version

wget http://d3kbcqa49mib13.cloudfront.net/spark-2.2.0-bin-hadoop2.7.tgz
tar xvf spark-2.2.0-bin-hadoop2.7.tgz

export SPARK_HOME=$HOME/spark-2.2.0-bin-hadoop2.7 >> ~/.bashrc
export PATH=$PATH:$SPARK_HOME/bin >> ~/.bashrc

firewall-cmd --permanent --zone=public --add-port=6066/tcp
firewall-cmd --permanent --zone=public --add-port=7077/tcp
firewall-cmd --permanent --zone=public --add-port=8080-8081/tcp
firewall-cmd --reload

echo 'export PATH=$PATH:/usr/lib/scala/bin' >> .bash_profile
echo 'export SPARK_HOME=$HOME/spark-1.6.0-bin-hadoop2.6' >> .bash_profile
echo 'export PATH=$PATH:$SPARK_HOME/bin' >> .bash_profile
