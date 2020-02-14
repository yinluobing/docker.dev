ARG CENTOS_VERSION
ARG CENTOS_PASSWROD
FROM centos:${CENTOS_VERSION}
LABEL maintainer="baidu120.cc"

# set timezome
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && \
    mkdir -p /var/run/sshd && \
    echo 'root:${CENTOS_PASSWROD}' | chpasswd && \
    yum -y update && \
    yum -y install openssh-server && \
    ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key && \
    ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key && \
    yum clean all && \
    rm -rf /var/cache/yum/* && \
    sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config && \
    chmod 755 /start.sh

CMD ["/start.sh"]

WORKDIR /var/www/html
