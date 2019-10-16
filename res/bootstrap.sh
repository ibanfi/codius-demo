#!/bin/bash

# Set prompt
echo "export PS1=\"\[\e[1;32m\]\h:\W $\[\e[0m\] \"" >> .bash_profile

# Set LANG environments
echo "LANG=en_US.utf-8" > /etc/environment
echo "LC_ALL=en_US.utf-8" >> /etc/environment

# Install yum-config-manager
yum install -y yum-utils

# Add docker-ce repository
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
# Add yarn repository
curl -sL https://dl.yarnpkg.com/rpm/yarn.repo | sudo tee /etc/yum.repos.d/yarn.repo
# Add nodejs repository
curl -sL https://rpm.nodesource.com/setup_10.x | bash

# Install packages
yum install -y gcc-c++ make libtool net-tools git device-mapper-persistent-data lvm2 yarn nodejs docker-ce docker-ce-cli containerd.io epel-release dnsmasq

# Setup and start local DNS server
cp res/dnsmasq.conf /etc/
cp /etc/resolv.conf /etc/resolv.dnsmasq
echo nameserver 127.0.0.1 > /etc/resolv.conf
systemctl enable dnsmasq
systemctl start dnsmasq

# Install codius
yarn global add codius

#Install and enable nginx
yum install -y nginx
systemctl enable nginx
cp res/nginx-codius.conf /etc/nginx/conf.d/
cp res/nginx-selfsigned.crt /etc/ssl/certs/
cp res/nginx-selfsigned.key /etc/ssl/certs/
cp res/nginx-selfsigned.crt /usr/share/pki/ca-trust-source/anchors/
cp res/dhparam.pem /etc/ssl/certs/
update-ca-trust force-enable
update-ca-trust extract

systemctl start nginx
setsebool -P httpd_can_network_connect 1

# Start docker
systemctl enable docker
systemctl start docker

# Add vagrant user to docker group
usermod -g docker vagrant