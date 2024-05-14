FROM debian:latest
LABEL maintainer="moclojer.com"

RUN apt -y update && \
    apt install -y \
    curl git openssl wget \
    build-essential libssl-dev \
    vim curl git python3 python3-pip \
    squidclient procps apache2-utils

ADD . /apps/
WORKDIR /apps

RUN wget -O - https://www.squid-cache.org/Versions/v6/squid-6.9.tar.gz | tar zxfv - && \
    if [ $(( `nproc --all`-1 )) -eq 0 ]; then CPU=1; else CPU=$(( `nproc --all`-1 )); fi && \
    cd /apps/squid-6.9 && \
    ./configure --prefix=/apps/squid \
        --enable-icap-client \
        --enable-ssl \
        --with-openssl \
        --enable-ssl-crtd \
        --enable-auth \
        --enable-basic-auth-helpers="NCSA" && \
    make -j$CPU && make install && \
    cd /apps && rm -rf /apps/squid-6.9

# /apps/squid/libexec/security_file_certgen -c -s /apps/squid/var/lib/ssl_db -M 4MB && \

RUN chown -R nobody:nogroup /apps/ && \
    chown -R nobody:nogroup /apps/ && \
    chgrp -R 0 /apps && chmod -R g=u /apps && \
    ln -s /usr/bin/python3 /usr/bin/python && \
    chmod +x /apps/entrypoint.sh

EXPOSE 3128

ENTRYPOINT [ "/apps/entrypoint.sh" ]
