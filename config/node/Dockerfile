ARG NODE_VERSION
FROM node:${NODE_VERSION}
LABEL maintainer="baidu120.cc"

# set timezome
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

WORKDIR /var/www/html