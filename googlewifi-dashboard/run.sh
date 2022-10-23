#!/usr/bin/with-contenv bashio

export REFRESH_TOKEN=$(bashio::config 'refresh_token')
bashio::log.info "Refresh token configured as ${REFRESH_TOKEN}."

bashio::log.info "Building dashboard."
cd /tmp/dashboard
npm run build

bashio::log.info "Start NGINX"
nginx -g 'daemon off;error_log /dev/stdout debug;'