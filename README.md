# p001 - HPPT PROXY

Easy docker image to run a simple http proxy server with basic auth (squid).

**docker image:** `ghcr.io/moclojer/p001:latest`
**port:** `3128` *we do not support changing the port yet*
**user/pass?** if you want to use a proxy with username and password (which we recommend), you need to set the environment variables `P001_USER` and `P001_USER`

## docker compose example

"A simple way to use the Docker image is through ﻿docker compose. Below is an example of how to use the image."

```yaml
version: "3"
services:
  squid:
    image: ghcr.io/moclojer/p001:latest
    entrypoint: /apps/entrypoint.sh
    ports:
      - "3128:3128"
    environment:
      - P001_USER=moclojer
      - P001_PASS=moclojer
      - P001_PORT=3128
    volumes:
      - ./squid.conf:/apps/squid.conf
      - ./htpasswd:/apps/htpasswd
```
