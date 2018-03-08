ARG BUILD_FROM=hassioaddons/base-amd64:1.3.2
FROM ${BUILD_FROM}

# Setup base
RUN \
     apk add --no-cache \
            git \
            nodejs \
            nodejs-npm \
        \
        && npm set unsafe-perm true \
        \
        && npm -g -S install \
            alexa-reminders
        
COPY index.js /

RUN npm install

EXPOSE 8091

COPY run.sh /

RUN chmod a+x /run.sh

CMD [ "/run.sh" ]

# Labels
LABEL \
    io.hass.name="Alexa Reminders" \
    io.hass.description="Create reminders on your Alexa device" \
    io.hass.type="addon" \
    maintainer="Michael Burks" \
    org.label-schema.description="Create reminders on your Alexa device" \
    org.label-schema.build-date=${BUILD_DATE} \
    org.label-schema.name="Alexa Reminders" \
    org.label-schema.schema-version="1.0" \
    org.label-schema.url="https://github.com/dumbstart/alexa-reminders" \
    org.label-schema.usage="https://github.com/dumbstart/alexa-reminders/blob/master/README.md" \
    org.label-schema.vcs-ref=${BUILD_REF} \
    org.label-schema.vcs-url="https://github.com/dumbstart/alexa-reminders" \
    org.label-schema.vendor="Dumbstart Alexa Reminder"

