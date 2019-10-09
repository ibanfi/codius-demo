#!/bin/bash
cp res/codiusd.service /etc/systemd/system/

# yarn add codiusd
npm install -g codiusd --unsafe-perm

systemctl enable codiusd
systemctl start codiusd