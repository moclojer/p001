#!/bin/bash

htpasswd -b -c /apps/htpasswd $P001_USER $P001_PASS
sed "s/P001_PORT/$P001_PORT/g" /apps/squid.conf.template > /apps/squid.conf
/apps/squid/sbin/squid -f /apps/squid.conf -NYCd 1
