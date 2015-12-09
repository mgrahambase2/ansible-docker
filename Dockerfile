FROM ubuntu:12.04
MAINTAINER mgraham_1974@hotmail.com

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
