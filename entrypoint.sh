#!/bin/bash

htpasswd -b -c /apps/squid/htpasswd $P001_USER $P001_PASS
/apps/squid/sbin/squid -f /apps/squid.conf -NYCd 1
