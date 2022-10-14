ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN apk add --no-cache \
nodejs \
npm \
git

RUN git clone https://github.com/JamesHawkinss/google-wifi-dashboard
RUN cd /google-wifi-dashboard && npm install --unsafe-perm

COPY run.sh /google-wifi-dashboar
RUN chmod a+x /google-wifi-dashboar/run.sh

CMD [ "/google-wifi-dashboar/run.sh" ]
