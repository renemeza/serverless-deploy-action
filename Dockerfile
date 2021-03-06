FROM node:8.15.1-alpine

LABEL version="1.0.0"
LABEL name="serverless-deploy-action"

LABEL "com.github.actions.name"="serverless-deploy-action"
LABEL "com.github.actions.description"="Deploy serverless action"
LABEL "com.github.actions.icon"="zap"
LABEL "com.github.actions.color"="red"

RUN apk add --no-cache \
    python \
    py-pip \
    ca-certificates \
    openssl \
    groff \
    less \
    bash \
    curl \
    jq \
    git \
    zip \
    build-base

RUN npm i -g serverless@1.39.0

ENV PATH="/usr/local/bin:${PATH}"
COPY bin /usr/local/bin

RUN chmod +x /usr/local/bin/*

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

