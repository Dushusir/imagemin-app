FROM keymetrics/pm2:latest-alpine
# FROM node:13.7.0-alpine
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories
RUN apk add --update \
    bash \
    lcms2-dev \
    libpng-dev \
    gcc \
    g++ \
    make \
    autoconf \
    automake \
  && rm -rf /var/cache/apk/*

# Bundle APP files
RUN mkdir -p /min-app
WORKDIR /min-app
COPY . /min-app

RUN npm config set registry https://registry.npm.taobao.org
RUN npm install

# WORKDIR /home/node/app
# USER node

EXPOSE 3000
CMD ["node", "app.js"]