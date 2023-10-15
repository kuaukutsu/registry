PHP_VERSION ?= 8.1

fpm-build:
	docker buildx build \
		--platform linux/amd64,linux/arm64 --push \
		-f ./php/${PHP_VERSION}/fpm/Dockerfile \
		-t ghcr.io/kuaukutsu/php:${PHP_VERSION}-fpm .

cli-build:
	docker buildx build \
		--platform linux/amd64,linux/arm64 --push \
		-f ./php/${PHP_VERSION}/cli/Dockerfile \
		-t ghcr.io/kuaukutsu/php:${PHP_VERSION}-cli .
