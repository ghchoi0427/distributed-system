#!/bin/bash

sudo apt-get update

# packages for networking
sudo apt-get -y net-tools iproute2 iputils-ping # ifconfig, ip, ping

# common packages for development (including C/C++)
sudo apt-get -y install build-essential # gcc, make, and so on

# packages for JAVA
sudo apt-get -y install openjdk-11-jdk

# additional tasks for JAVA
echo >> /home/vagrant/.bashrc
echo "export JAVA_HOME=\$(readlink -f /usr/bin/java | sed 's:bin/java::')" >> /home/vagrant/.bashrc

# packages for Golang
goBinary=$(curl -s https://go.dev/dl/ | grep linux | head -n 1 | cut -d'"' -f4 | cut -d"/" -f3)
wget --quiet https://dl.google.com/go/$goBinary -O /tmp/$goBinary
sudo tar -C /usr/local -xzf /tmp/$goBinary
rm /tmp/$goBinary

# additional tasks for Golang
echo >> /home/vagrant/.bashrc
echo "export GOPATH=\$HOME/go" >> /home/vagrant/.bashrc
echo "export GOROOT=/usr/local/go" >> /home/vagrant/.bashrc
echo "export PATH=\$PATH:/usr/local/go/bin:\$HOME/go/bin" >> /home/vagrant/.bashrc
echo >> /home/vagrant/.bashrc
mkdir -p /home/vagrant/go
chown -R vagrant:vagrant /home/vagrant/go

# packages for python3
sudo apt-get -y install python3-pip
