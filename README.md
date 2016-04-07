# Standalone Sidekiq Web

Launch a standalone Sidekiq Web dashboard via Docker

## Build

```
$ docker build -t sidekiq-web:dev .
```

## Run

```
$ docker run -P -e REDIS_URL=<the redis url> -it sidekiq-web:dev
```

## Configuration

```
REDIS_SIZE: Concurrency setting (default: 1)
REDIS_URL: The redis host URL (default: redis://localhost:6379/0)
SIDEKIQ_CRON: Set to true to enable the Sidekiq Cron view (default: false)
```
