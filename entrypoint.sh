#!/bin/bash

source /src/.env

htpasswd -c -B -b /etc/squid/htpasswd ${P001_USER} ${P001_PASS}
squid -f /etc/squid/squid.conf -NYCd 1
