ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8

COPY run.sh /
COPY index.js /

RUN \
    apk add --no-cache \
        nodejs \
        nodejs-npm \
    \
    && npm install \
    \
    && npm install ngrok \
    \
    && npm install express \
    \
    && npm install body-parser \
    \
    && npm install fs \
    \
    && npm install alexa-reminders

RUN npm install

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

