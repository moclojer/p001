FROM ubuntu/squid:latest
LABEL maintainer="moclojer.com"

ADD squid.conf /etc/squid/squid.conf
ADD entrypoint.sh /src/entrypoint.sh

RUN apt -y update && \
    apt install -y apache2-utils && \
    mkdir -p /usr/lib/squid && \
    /usr/lib/squid/security_fake_certverify -c -s /usr/lib/squid/ssl_db -M 4MB

RUN chmod +x /src/entrypoint.sh

EXPOSE 3128

ENTRYPOINT [ "/apps/entrypoint.sh" ]
