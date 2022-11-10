#!/usr/bin/with-contenv bashio

export INGRESS_ENTRY=$(bashio::addon.ingress_entry)
export VITE_HA_REFRESH_TOKEN=$(bashio::config 'refresh_token')

bashio::log.info "Refresh token configured as ${VITE_HA_REFRESH_TOKEN}."

bashio::log.info "Building dashboard."
cd /tmp/google-wifi-dashboard
npm run build -- --base=${INGRESS_ENTRY}
ln -s /tmp/google-wifi-dashboard/dist/ /var/www/html

bashio::log.info "Start NGINX"
nginx -g 'daemon off;error_log /dev/stdout debug;'