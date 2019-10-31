ARG REDIS_VERSION
FROM redis:${REDIS_VERSION}
LABEL maintainer="baidu120.cc"

# set timezome
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone