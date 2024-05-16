# p001 - HPPT proxy server in docker

Easy docker image to run a simple http proxy server with basic auth (squid).

* **docker image:** `ghcr.io/moclojer/p001:latest`
* **port:** `3128` *default*, if you want to set a different port you must declare the environment variable `P001_PORT` *(it will proxy in docker)*
* **user/pass?** `moclojer` *default*, if you want to use a proxy with username and password (which we recommend), you need to set the environment variables `P001_USER` and `P001_USER`

## docker compose example

"A simple way to use the Docker image is through ﻿docker compose. Below is an example of how to use the image."

```yaml
version: "3"
services:
  squid:
    image: ghcr.io/moclojer/p001:latest
    ports:
      - ${P001_PORT:-3128}:3128
    environment:
      - P001_USER=$P001_USER
      - P001_PASS=$P001_PASS
    volumes:
      - .env:/src/.env
```
