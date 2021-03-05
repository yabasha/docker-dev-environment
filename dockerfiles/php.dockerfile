FROM php:8-fpm-alpine

ARG user
ARG uid

ADD ./php/www.conf /usr/local/etc/php-fpm.d/www.conf

RUN addgroup -g $uid $user && adduser -G $user -g $user -s /bin/sh -D $user

RUN mkdir -p /var/www/html

RUN chown $user:$user /var/www/html

WORKDIR /var/www/html

RUN docker-php-ext-install pdo pdo_mysql