#!/bin/bash
# TODO: solve tput problem (It crashes the vagrant install)
bash res/hyper-bootstrap.sh

systemctl enable hyperd
systemctl start hyperd

mv res/debug-start-codiusd.sh .
mv res/start-codiusd.sh .

chmod +x ./debug-start-codiusd.sh
chmod +x ./start-codiusd.sh
