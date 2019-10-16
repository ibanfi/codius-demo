#!/bin/bash
docker run -d -it --name moneyd -p 7768:7768 -p 7770:7770 ibanfi/moneyd