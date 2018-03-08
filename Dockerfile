FROM debian:jessie

# Setup base
RUN \
    apt-get update && apt-get install -q -y --no-install-recommends \
        jq
    && apk add --no-cache \
        git \
        nodejs \
        nodejs-npm \
    \
    && npm set unsafe-perm true \
    \
    && npm -S install \
        alexa-reminders
COPY index.js /
RUN npm install

EXPOSE 8091

COPY run.sh /

RUN chmod a+x /run.sh

CMD [ "/run.sh" ]