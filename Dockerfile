FROM wordpress:latest

LABEL org.opencontainers.image.source="https://github.com/Greite/wordpress-redis"
LABEL org.opencontainers.image.description="WordPress with phpredis extension"

RUN pecl install redis \
    && docker-php-ext-enable redis \
    && rm -rf /tmp/pear
