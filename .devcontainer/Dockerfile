FROM ubuntu:22.04

LABEL VERSION="1.0"
LABEL AUTHOR "Frozen Eye <frozen.eye.min@gmail.com>"
LABEL MAINTAINER "Frozen Eye <frozen.eye.min@gmail.com>"

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
  unzip \
  build-essential \
  cmake \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# add user mapping
ARG CONTAINER_USER=dev
ENV USER=${CONTAINER_USER}
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN groupadd --gid $USER_GID $CONTAINER_USER \
    && adduser --uid $USER_UID --gid $USER_GID --disabled-password --gecos "" ${CONTAINER_USER} \
    && usermod -a -G dialout,plugdev $CONTAINER_USER
