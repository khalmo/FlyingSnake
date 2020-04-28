FROM python:3-alpine

MAINTAINER Khalmo

RUN apk add --no-cache mariadb-dev g++ && \
    pip install --no-cache-dir discord.py aiohttp mysqlclient && \
    apk del g++ mariadb-dev && \
    apk add --no-cache mariadb-client && \
    adduser -D -h /home/container container

USER container
ENV  USER=container HOME=/home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
