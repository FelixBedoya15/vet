#!/bin/sh
set -e

echo "Generating logrotate config using LOGROTATE_ROTATE=${LOGROTATE_ROTATE}"
envsubst '${LOGROTATE_ROTATE}' < /template/logrotate.conf.tpl > /etc/logrotate.d/nginx
chmod 644 /etc/logrotate.d/nginx

echo "Generating nginx config using NGINX_WORKER_CONNECTIONS=${NGINX_WORKER_CONNECTIONS} NGINX_WORKER_PROCESSES=${NGINX_WORKER_PROCESSES}"
envsubst '${NGINX_WORKER_CONNECTIONS} ${NGINX_WORKER_PROCESSES}' < /template/nginx.conf.tpl > /etc/nginx/nginx.conf
chmod 644 /etc/nginx/nginx.conf

echo "Starting cron service to handle log rotation"
service cron start

nginx

exec "$@"
