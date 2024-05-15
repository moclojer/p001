FROM ubuntu/squid:latest
LABEL maintainer="moclojer.com"
LABEL org.opencontainers.image.source https://github.com/moclojer/p001

ADD squid.conf /etc/squid/squid.conf
ADD entrypoint.sh /src/entrypoint.sh

RUN apt -y update && apt install -y apache2-utils
#     mkdir -p /usr/lib/squid && \
#     /usr/lib/squid/security_fake_certverify -c -s /usr/lib/squid/ssl_db -M 4MB

RUN chmod +x /src/entrypoint.sh

EXPOSE 3128

ENTRYPOINT [ "/src/entrypoint.sh" ]
