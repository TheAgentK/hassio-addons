ARG BUILD_FROM
FROM $BUILD_FROM

# Install requirements for add-on

RUN apk add --no-cache \
 nodejs \
 npm \
 git

WORKDIR /data

RUN git clone https://github.com/JamesHawkinss/google-wifi-dashboard.git
RUN cd google-wifi-dashboard && npm install --unsafe-perm

COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
