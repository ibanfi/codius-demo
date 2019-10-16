#!/bin/bash
# docker run -dit --name moneyd \
#     -e MONEYD_BIND_IP="0.0.0.0" \
#     -p 7768:7768 \
#     -p 7770:7770 \
#     ibanfi/moneyd
yarn global add moneyd moneyd-uplink-xrp
# yum install -y https://codius.s3.amazonaws.com/moneyd-xrp-4.0.0-1.x86_64.rpm

# git clone https://github.com/interledgerjs/moneyd-gui.git
# cd moneyd-gui
# npm install