# wordpress-redis

Image Docker WordPress avec l'extension PHP Redis, publiée sur GHCR.

## Repo GitHub

- **Repo** : `Greite/wordpress-redis`
- **Image** : `ghcr.io/greite/wordpress-redis:latest`

## Structure

- `Dockerfile` : basé sur `wordpress:latest`, installe phpredis via `pecl install redis`
- `.github/workflows/build.yml` : build multi-plateforme (amd64/arm64), push sur GHCR
  - Déclenché sur push (main), cron quotidien (04h UTC), ou manuellement
  - Vérifie les mises à jour upstream via `lucacome/docker-image-update-checker`

## Test local

```bash
docker build -t wordpress-redis .
docker run --rm wordpress-redis php -m | grep redis
```
