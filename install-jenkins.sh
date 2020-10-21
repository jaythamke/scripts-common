#! /bin/bash

set -e

sudo apt-get update
sudo apt-get -y install openjdk-8-jdk gnupg rng-tools docker.io
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt update
sudo apt install jenkins
sudo systemctl start jenkins
sudo systemctl status jenkins

echo "Checking if tcp port *::8080 is already accessible"
netstat -ntlp | grep 8080

echo -n "\nIf you are installing Jenkins on aws EC2 instance then consider adding inbound rule for jenkins access at port 8080 under CIDR 0.0.0.0/0"

echo -n "\n HAPPY JENKINS"
