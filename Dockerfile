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
    && npm -g install \
        npm install -S alexa-reminders

# Build arugments
ARG BUILD_ARCH
ARG BUILD_DATE
ARG BUILD_REF
ARG BUILD_VERSION

# Labels
LABEL \
    io.hass.name="Alexa Reminders" \
    io.hass.description="Create reminders on your Alexa device" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version=${BUILD_VERSION} \
    maintainer="Michael Burks" \
    org.label-schema.description="Create reminders on your Alexa device" \
    org.label-schema.build-date=${BUILD_DATE} \
    org.label-schema.name="Alexa Reminders" \
    org.label-schema.schema-version="1.0" \
    org.label-schema.url="https://community.home-assistant.io/t/community-hass-io-add-on-homebridge/33803?u=frenck" \
    org.label-schema.usage="https://github.com/dumbstart/hassio-addons/blob/master/README.md" \
    org.label-schema.vcs-ref=${BUILD_REF} \
    org.label-schema.vcs-url="https://github.com/dumbstart/alexa-reminders" \
    org.label-schema.vendor="Dumbstart Hassio add-ons"