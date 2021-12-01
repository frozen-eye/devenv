FROM ubuntu:18.04

LABEL VERSION="1.0"
LABEL AUTHOR "Frozen Eye <frozen.eye.min@gmail.com>"
LABEL MAINTAINER "Frozen Eye <frozen.eye.min@gmail.com"

ENV HOSTNAME=dev
ENV DEBIAN_FRONTEND=noninteractive
ENV TERM=xterm-color

# APT stuff
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
  unzip \
  build-essential \
  cmake \
  gcc-aarch64-linux-gnu g++-aarch64-linux-gnu \
  libboost-dev \
  libdpdk-dev \
  libnuma-dev \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# add user mapping
RUN useradd -u 1000 -m -d /home/dev dev && usermod -aG sudo dev

# sudoers
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# user maintenance
USER dev
WORKDIR /home/dev
