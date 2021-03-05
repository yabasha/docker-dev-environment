FROM nginx:stable-alpine

ARG user
ARG uid

ADD ./nginx/nginx.conf /etc/nginx/nginx.conf
ADD ./nginx/default.conf /etc/nginx/conf.d/default.conf

RUN mkdir -p /var/www/html

RUN apk add --no-cache \
        wget \
        vim

RUN addgroup -g $uid $user && adduser -G $user -g $user -s /bin/sh -D $user

RUN chown $user:$user /var/www/html