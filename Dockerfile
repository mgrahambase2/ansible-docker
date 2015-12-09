FROM ubuntu:12.04
MAINTAINER mgraham_1974@hotmail.com
RUN cp /etc/apt/sources.list /etc/apt/sources.list.backup \
    && > /etc/apt/sources.list
RUN  touch /etc/apt/sources.list \
    && echo "deb http://au.archive.ubuntu.com/ubuntu/ trusty main" > /etc/apt/sources.list
RUN  apt-get update \
     && apt-get install -y software-properties-common \
    && apt-add-repository ppa:ansible/ansible \
    && apt-get update \
    && apt-get install ansible
RUN mkdir /etc/ansible \
    && touch /etc/ansible/hosts \
    && mkdir /root/.ssh
COPY content/id_rsa /root/.ssh/
CMD ["/bin/bash"]
