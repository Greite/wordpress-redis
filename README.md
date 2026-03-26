# WordPress + Redis

Docker image based on the official [`wordpress:latest`](https://hub.docker.com/_/wordpress) with the [phpredis](https://github.com/phpredis/phpredis) extension pre-installed.

Multi-platform: `linux/amd64` and `linux/arm64`.

## Pull

```bash
docker pull ghcr.io/greite/wordpress-redis:latest
```

## Tags

| Tag | Description |
|---|---|
| `latest` | Most recent build |
| `YYYYMMDD` | Date-based immutable tag |
| `wp-X.Y.Z` | WordPress version |
| `<sha>` | Git commit SHA |

## Usage with Docker Compose

```yaml
services:
  wordpress:
    image: ghcr.io/greite/wordpress-redis:latest
    ports:
      - "8080:80"
    environment:
      WORDPRESS_DB_HOST: db
      WORDPRESS_DB_USER: wordpress
      WORDPRESS_DB_PASSWORD: wordpress
      WORDPRESS_DB_NAME: wordpress
    depends_on:
      - db
      - redis

  db:
    image: mariadb:latest
    environment:
      MYSQL_DATABASE: wordpress
      MYSQL_USER: wordpress
      MYSQL_PASSWORD: wordpress
      MYSQL_ROOT_PASSWORD: root

  redis:
    image: redis:alpine
```

> The phpredis extension is installed and enabled. To use Redis as an object cache in WordPress, install a plugin like [Redis Object Cache](https://wordpress.org/plugins/redis-cache/).

## Automatic updates

A GitHub Actions workflow runs twice daily and rebuilds the image whenever the upstream `wordpress:latest` digest changes.
