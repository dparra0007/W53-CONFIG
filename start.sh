#!/bin/bash
set -e

cd /usr/src/app/conf
rm -rf /usr/src/app/conf/*
rm -f /usr/src/app/conf/.env
STR=$'#!/bin/bash\n'
echo "$STR" > .env

wget https://raw.githubusercontent.com/dparra0007/W53-GLOBAL-CONFIG/conjur/env.sh -O env-global.sh 

wget $SYSTEMCONF -O env-project.sh

cat env-global.sh env-project.sh > .env

nginx -g "daemon off;"