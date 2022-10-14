#!/usr/bin/with-contenv bashio

export REFRESH_TOKEN=$(bashio::config 'refresh_token')
bashio::log.info "Refresh token configured as ${REFRESH_TOKEN}."

ls -la

pwd

cd google-wifi-dashboard

bashio::log.info "Starting dashboard."
npm run serve