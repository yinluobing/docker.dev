# 运行服务的命令
ARG PYTHON_VERSION
ARG ALPINE_REPOSITORIES
FROM python:${PYTHON_VERSION}
LABEL maintainer="baidu120.cc"

# set timezome
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# 更新Alpine的软件源为国内（清华大学）
RUN if [ "${ALPINE_REPOSITORIES}" != "" ]; then \
        sed -i "s/dl-cdn.alpinelinux.org/${ALPINE_REPOSITORIES}/g" /etc/apk/repositories; \
    fi

RUN python3
RUN apk update \
        && apk upgrade \
        && apk add --no-cache bash \
        && python3 /get-pip.py \
        && pip install virtualenv \
        && pip install virtualenvwrapper \
        && pip install -r /requirements.txt \
        && python3 -m pip uninstall -y pip setuptools wheel \
        && rm -rf /var/cache/apk/*

WORKDIR /var/www/html