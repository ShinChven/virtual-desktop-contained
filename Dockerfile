FROM ubuntu:bionic

COPY sources.163.list /etc/apt/sources.list

## install tools

RUN apt-get update && apt-get upgrade -y \
&& apt-get install -y apt-utils make curl cmake vim tzdata \
&& ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
&& export DEBIAN_FRONTEND=noninteractive \
&& dpkg-reconfigure --frontend noninteractive tzdata \
&& export DEBIAN_FRONTEND=

# install desktop

RUN apt-get install -y ubuntu-gnome-desktop

## install vnc

RUN apt-get install -y xserver-xorg-core tigervnc-standalone-server tigervnc-xorg-extension tigervnc-viewer
