FROM composer:latest

ARG user
ARG uid

RUN addgroup -g $uid $user && adduser -G $user -g $user -s /bin/sh -D $user

RUN mkdir -p /var/www/html

RUN chown $user:$user /var/www/html