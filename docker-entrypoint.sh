#!/bin/sh
set -e

if [[ "${REDIS_URL}" == "" ]]
then
    echo "REDIS_URL: redis://localhost:6379/0 (default)"
else
    echo "REDIS_URL: ${REDIS_URL}"
fi

if [[ "${REDIS_SIZE}" == "" ]]
then
    echo "REDIS_SIZE: 1 (default)"
else
    echo "REDIS_SIZE: ${REDIS_SIZE}"
fi

if [[ "${SIDEKIQ_CRON}" == "" ]]
then
    echo "SIDEKIQ_CRON: false (default)"
else
    echo "SIDEKIQ_CRON: ${SIDEKIQ_CRON}"
fi

if [[ "${SIDEKIQ_HOST}" == "" ]]
then
    echo "SIDEKIQ_HOST: 127.0.0.1 (default)"
else
    echo "SIDEKIQ_HOST: ${SIDEKIQ_HOST}"
fi

if [[ "${SIDEKIQ_USERNAME}" == "" ]]
then
    echo "SIDEKIQ_USERNAME: NONE (default)"
else
    echo "SIDEKIQ_USERNAME: ${SIDEKIQ_USERNAME}"
fi

if [[ "${SIDEKIQ_PASSWORD}" == "" ]]
then
    echo "SIDEKIQ_PASSWORD: NONE (default)"
else
    echo "SIDEKIQ_PASSWORD: User Set"
fi

exec "$@"
