ARG TOMCAT_VERSION
FROM openjdk:${TOMCAT_VERSION}-alpine
LABEL maintainer="baidu120.cc"

ARG TZ
ARG ALPINE_REPOSITORIES

RUN if [ "${ALPINE_REPOSITORIES}" != "" ]; then \
        sed -i "s/dl-cdn.alpinelinux.org/${ALPINE_REPOSITORIES}/g" /etc/apk/repositories; \
    fi

RUN apk --no-cache add tzdata \
    && cp "/usr/share/zoneinfo/$TZ" /etc/localtime \
    && echo "$TZ" > /etc/timezone

COPY ./install /tmp/install
WORKDIR /tmp/install

ENV MC="-j$(nproc)"

RUN export MC="-j$(nproc)" \
    && chmod +x install.sh \
    && sh install.sh \
    && rm -rf /tmp/install

WORKDIR /var/www/html