FROM php:8.4-fpm-alpine3.20

################################
###    FPM BASE LAYER        ###
################################

# https://github.com/mlocati/docker-php-extension-installer
COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/bin/

# make sure you can use HTTPS
RUN apk --update add ca-certificates

# persistent / runtime deps
RUN apk update \
    && apk add --no-cache --virtual .persistent-deps \
        git \
        curl \
        wget \
        tar \
        libressl \
        freetype \
        openssl \
        unzip \
        zip

# install and remove building packages
RUN install-php-extensions \
    apcu \
    opcache \
    intl \
    pcntl \
    pdo_mysql \
    pdo_pgsql \
    redis \
    sockets \
    zip

# Configure
COPY ./php.ini /usr/local/etc/php/php.ini
COPY ./www.conf /usr/local/etc/php-fpm.d/www.conf

EXPOSE 9000
