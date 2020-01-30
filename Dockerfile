FROM ubuntu:bionic

COPY sources.163.list /etc/apt/sources.list

## install tools

RUN apt-get update && apt-get upgrade -y \
&& apt-get install -y apt-utils vim tzdata \
&& ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
&& export DEBIAN_FRONTEND=noninteractive \
&& dpkg-reconfigure --frontend noninteractive tzdata \
&& export DEBIAN_FRONTEND=

# install desktop

RUN apt-get install -y ubuntu-gnome-desktop

## install vnc

RUN apt-get install -y xserver-xorg-core tigervnc-standalone-server tigervnc-xorg-extension tigervnc-viewer

COPY xstartup /root/.vnc/xstartup

# Set user for VNC server (USER is only for build)
ENV USER root
# Set default password
COPY password.txt .
RUN cat password.txt password.txt | vncpasswd && \
  rm password.txt
# Expose VNC port
EXPOSE 5901
