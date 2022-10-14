ARG BUILD_FROM
FROM $BUILD_FROM

# Install requirements for add-on
RUN apk add --no-cache \
  nodejs \
  npm \
  git

WORKDIR /data

RUN git clone https://github.com/JamesHawkinss/google-wifi-dashboard .
RUN npm install

COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
