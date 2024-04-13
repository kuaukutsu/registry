# Container registry

Store and manage Docker and OCI images in the Container registry, 
which uses the package namespace https://ghcr.io

[![Docker Image CI](https://github.com/kuaukutsu/registry/actions/workflows/docker-image.yml/badge.svg)](https://github.com/kuaukutsu/registry/actions/workflows/docker-image.yml)

Save your personal access token (classic). We recommend saving your token as an environment variable.

```shell
export CR_PAT=YOUR_TOKEN
```

Using the CLI for your container type, sign in to the Container registry service at ghcr.io.

```shell
$ echo $CR_PAT | docker login ghcr.io -u USERNAME --password-stdin
```

## Docs:
- https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-container-registry

## Registry

### Build

Default: php version 8.1

```shell
make fpm-build
```

```shell
PHP_VERSION=8.2 make cli-build
```

## Download

### PHP 8.1

```shell
docker pull ghcr.io/kuaukutsu/php:8.1-cli
```

```shell
docker pull ghcr.io/kuaukutsu/php:8.1-fpm
```

### PHP 8.2

```shell
docker pull ghcr.io/kuaukutsu/php:8.2-cli
```

```shell
docker pull ghcr.io/kuaukutsu/php:8.2-fpm
```

### PHP 8.3

```shell
docker pull ghcr.io/kuaukutsu/php:8.3-cli
```

```shell
docker pull ghcr.io/kuaukutsu/php:8.3-fpm
```

## update

- 2024/04/13
