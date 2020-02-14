# 运行服务的命令
ARG PYTHON_VERSION
ARG ALPINE_REPOSITORIES
FROM python:${PYTHON_VERSION}
LABEL maintainer="baidu120.cc"

# set timezome
ENV TZ=Asia/Shanghai
RUN cp "/usr/share/zoneinfo/$TZ" /etc/localtime

COPY ./get-pip.py /tmp/get-pip.py
COPY ./requirements.txt /tmp/requirements.txt

# 更新Alpine的软件源为国内（清华大学）
RUN if [ "${ALPINE_REPOSITORIES}" != "" ]; then \
        sed -i "s/dl-cdn.alpinelinux.org/${ALPINE_REPOSITORIES}/g" /etc/apk/repositories; \
    fi

RUN apk update \
        && apk upgrade \
        && apk add --no-cache bash \
        && python /tmp/get-pip.py \
        && pip install virtualenv \
        && pip install virtualenvwrapper \
        && pip install -r /tmp/requirements.txt \
        && rm -rf /var/cache/apk/* \
        && rm -rf /tmp/*

WORKDIR /var/www/html
