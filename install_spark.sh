#!/bin/bash
#install Spark on CentOS 7

## install java
cd /tmp
wget http://ftp.wsisiz.edu.pl/pub/pc/pozyteczne%20oprogramowanie/java/jdk-8u131-linux-x64.rpm
sudo rpm -ivh /tmp/jdk-8u131-linux-x64.rpm
sudo rm /tmp/jdk-8u131-linux-x64.rpm
## append /etc/profile 

echo 'JAVA_HOME=/usr/java/java' >> ~/.bashrc
echo 'JRE_HOME=$JAVA_HOME/jre'  >> ~/.bashrc echo 'CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar:$JRE_HOME/lib/rt.jar'  >> ~/.bashrc
echo 'PATH=$PATH:$JAVA_HOME/bin'  >> ~/.bashrc

source ~/.bashrc
java -version

sudo yum install wget -y
wget http://downloads.typesafe.com/scala/2.11.11/scala-2.11.11.tgz
tar xvf scala-2.11.11.tgz
sudo mv scala-2.11.11 /usr/lib
sudo ln -s /usr/lib/scala-2.11.11 /usr/lib/scala
echo 'PATH=$PATH:/usr/lib/scala/bin' >> ~/.bashrc
source ~/.bashrc
scala -version

wget http://d3kbcqa49mib13.cloudfront.net/spark-2.2.0-bin-hadoop2.7.tgz
tar xvf spark-2.2.0-bin-hadoop2.7.tgz

export SPARK_HOME=$HOME/spark-2.2.0-bin-hadoop2.7 >> ~/.bashrc
export PATH=$PATH:$SPARK_HOME/bin >> ~/.bashrc

firewall-cmd --permanent --zone=public --add-port=6066/tcp
firewall-cmd --permanent --zone=public --add-port=7077/tcp
firewall-cmd --permanent --zone=public --add-port=8080-8081/tcp
firewall-cmd --reload

echo 'export PATH=$PATH:/usr/lib/scala/bin' >> ~/.bash_profile
echo 'export SPARK_HOME=$HOME/spark-2.2.0-bin-hadoop2.7' >> ~/.bash_profile
echo 'export PATH=$PATH:$SPARK_HOME/bin' >> ~/.bash_profile
source ~/.bash_profile
##execute  /etc/profile -> (~/.bash_profile | ~/.bash_login | ~/.profile) -> ~/.bashrc -> /etc/bashrc -> ~/.bash_logout
