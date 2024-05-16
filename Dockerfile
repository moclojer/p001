FROM ubuntu/squid:latest
LABEL maintainer="moclojer.com"
LABEL org.opencontainers.image.source https://github.com/moclojer/p001

ENV P001_USER "moclojer"
ENV P001_PASS "moclojer"

ADD squid.conf /etc/squid/squid.conf
ADD entrypoint.sh /src/entrypoint.sh

RUN apt -y update && apt install -y apache2-utils

RUN chmod +x /src/entrypoint.sh

EXPOSE 3128

ENTRYPOINT [ "/src/entrypoint.sh" ]
