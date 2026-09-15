FROM wordpress:latest

LABEL org.opencontainers.image.source="https://github.com/Greite/wordpress-redis"
LABEL org.opencontainers.image.description="WordPress with phpredis extension"

RUN pecl install redis \
    && docker-php-ext-enable redis \
    && rm -rf /tmp/pear

HEALTHCHECK --interval=1s --timeout=1s --start-period=10s --retries=10 \
    CMD curl -fsS -o /dev/null http://localhost/ || exit 1
