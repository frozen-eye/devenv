FROM ubuntu:16.04

LABEL VERSION="1.0"
LABEL AUTHOR "Frozen Eye <frozen.eye.min@gmail.com>"
LABEL MAINTAINER "Frozen Eye <frozen.eye.min@gmail.com"

ENV HOSTNAME=devenv
ENV DEBIAN_FRONTEND=noninteractive
ENV TERM=xterm-color

# remove cache and update api lists
RUN apt-get clean \
  && rm -rf /var/lib/apt/lists/*

RUN apt-get update \
  && apt-get install -y -qq \
  curl \
  bash-completion \
  apt-transport-https \
  software-properties-common \
  dialog \
  locales \
  pkgconf \
  sudo \
  unzip

# install gcc compiler
RUN apt-get update \
  && apt-get install -y -qq \
  build-essential \
  cmake \
  gcc-aarch64-linux-gnu g++-aarch64-linux-gnu \
  libdpdk-dev \
  libnuma-dev

#RUN apt-get update \
#  && apt-get install -y -qq \
#  gcc \
#  libffi-dev \
#  python-dev \
#  python-setuptools

# RUN easy_install web.py cffi

# TODO: uncomment this block later
# # update repo for docker-ce
# RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - \
#   && add-apt-repository \
#     "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
#     xenial \
#     stable"

# # install docker-ce, clean cache
# RUN apt-get update \
#   && apt-get install -y \
#   docker-ce

# # install docker-compose
# RUN curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose \
#   && chmod +x /usr/local/bin/docker-compose

# add new user
#RUN useradd -m -d /home/dev dev && usermod -aG docker,sudo dev
RUN useradd -m -d /home/dev dev && usermod -aG sudo dev

# sudoers
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# remove cache and update api lists
RUN apt-get clean \
  && rm -rf /var/lib/apt/lists/*

USER dev
WORKDIR /home/dev
