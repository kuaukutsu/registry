PHP_VERSION ?= 8.1

fpm-build:
	docker buildx build --push \
		--platform linux/amd64,linux/arm64 \
		-t ghcr.io/kuaukutsu/php:${PHP_VERSION}-fpm \
		./php/${PHP_VERSION}/fpm

cli-build:
	docker buildx build --push \
		--platform linux/amd64,linux/arm64 \
		-t ghcr.io/kuaukutsu/php:${PHP_VERSION}-cli \
		./php/${PHP_VERSION}/cli
