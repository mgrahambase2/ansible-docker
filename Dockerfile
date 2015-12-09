FROM ubuntu:12.04
MAINTAINER mgraham_1974@hotmail.com

RUN  sed -i -e 's/archive.ubuntu.com/au.archive.ubuntu.com/g' /etc/apt/sources.list \
     && apt-get update \
     && apt-get install -y software-properties-common \
     &&  apt-get install -y software-properties-common python-software-properties \
     && apt-add-repository ppa:ansible/ansible \
     && apt-get update -y \
     && apt-get install -y ansible
RUN touch /etc/ansible/hosts \
    && mkdir /root/.ssh
COPY content/id_rsa /root/.ssh/
CMD ["/bin/bash"]
