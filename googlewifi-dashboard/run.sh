#!/usr/bin/with-contenv bashio

export REFRESH_TOKEN=$(bashio::config 'refresh_token')
bashio::log.info "Refresh token configured as ${REFRESH_TOKEN}."

ls -la

bashio::log.info "Starting dashboard."
npm run serve