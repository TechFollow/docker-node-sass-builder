FROM node:erbium-alpine

RUN apk add --no-cache git

RUN npm i -g npm@6.9.0
RUN npm install -g firebase-tools@7.11.0

ARG FILE='linux-x64-72_binding.node'
# install node-sass
RUN \
  mkdir /opt/node-sass/ && \
  wget https://github.com/sass/node-sass/releases/download/v4.12.0/$FILE -O /opt/node-sass/$FILE

ENV SASS_BINARY_PATH=/opt/node-sass/$FILE

USER node

WORKDIR /usr/src/app/

CMD [ "yarn" ]