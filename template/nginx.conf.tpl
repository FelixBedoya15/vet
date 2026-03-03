user www-data;
worker_processes ${NGINX_WORKER_PROCESSES};
pid /run/nginx.pid;
error_log /var/log/nginx/error.log;
include /etc/nginx/modules-enabled/*.conf;

events {
    worker_connections ${NGINX_WORKER_CONNECTIONS};
}

http {
    include       /etc/nginx/mime.types;
    default_type  application/octet-stream;

    log_format full_log '$remote_addr - $remote_user [$time_local] '
                             '"$request" $status $body_bytes_sent '
                             '"$http_referer" "$http_user_agent" '
                             '$request_time $upstream_connect_time $upstream_header_time $upstream_response_time "$upstream_addr"';

    access_log /var/log/nginx/access.log full_log;

    sendfile on;
    tcp_nopush on;

    keepalive_timeout 65;

    gzip on;

    include /etc/nginx/conf.d/*.conf;
    include /etc/nginx/sites-enabled/*;
}
