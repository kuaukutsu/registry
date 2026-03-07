FROM php:8.4-cli-alpine3.23

################################
###    CLI BASE LAYER        ###
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

# profile
RUN <<EOF
  cat <<'INNER_EOF' >> /etc/profile

  # php version by login shell
  parse_php_version() {
      php -v | head -n 1 | awk '{print $2}'
  }

  if [ -n "$BASH_VERSION" ]; then
      PS1='[$(parse_php_version)] \[\033[0;34m\]\w\[\033[0m\] \$ '
  else
      PS1='[$(parse_php_version)] $PWD $ '
  fi
  export PS1
INNER_EOF
EOF
