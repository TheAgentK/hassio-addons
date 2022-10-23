ARG BUILD_FROM
FROM $BUILD_FROM

#Add nginx and create the run folder for nginx.
RUN \
  apk --update --no-cache add \
    nodejs \
    npm \
    nginx \
  \
  && mkdir -p /run/nginx

# Copy application to /tmp
COPY dashboard /tmp/dashboard
RUN cd /tmp/dashboard && npm install --unsafe-perm

# Copy our conf into the nginx http.d folder.
COPY ingress.conf /etc/nginx/http.d/

# Copy our conf into the nginx http.d folder.
# COPY rootfs /

COPY run.sh /
RUN chmod a+x /run.sh

#Launch nginx with debug options.
CMD [ "/run.sh" ]
# CMD [ "/run.sh; nginx","-g","daemon off;error_log /dev/stdout debug;"]