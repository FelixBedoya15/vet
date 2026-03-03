/var/log/nginx/*.log {
    daily
    dateext
    dateformat .%Y%m%d
    compress
    ifempty
    missingok
    rotate ${LOGROTATE_ROTATE}
    copytruncate
}
