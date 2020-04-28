FROM node:alpine
# RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories

RUN apk add --no-cache \
    file \
    libpng \
    bash \
    lcms2-dev \
    gcc \
    g++ \
    make \
    libtool \
    autoconf \
    automake \
    libc6-compat \
    libjpeg-turbo-dev \
    build-base \
    libpng-dev \
    nasm \
&& rm -rf /var/cache/apk/*

# Bundle APP files
RUN mkdir -p /min-app
WORKDIR /min-app
COPY . /min-app

# RUN npm config set registry https://registry.npm.taobao.org
RUN npm install

EXPOSE 3000
CMD ["node", "app.js"]