FROM ubuntu:bionic

COPY sources.163.list /etc/apt/sources.list

## install tools

RUN apt-get update && apt-get upgrade -y \
&& export DEBIAN_FRONTEND=noninteractive \
&& apt-get install -y apt-utils vim ubuntu-gnome-desktop xserver-xorg-core tigervnc-standalone-server tigervnc-xorg-extension tigervnc-viewer \
&& echo "/usr/sbin/lightdm" > /etc/X11/default-display-manager \
&& export DEBIAN_FRONTEND=

COPY xstartup /root/.vnc/xstartup

# Set user for VNC server (USER is only for build)
ENV USER root
# Set default password
COPY password.txt .
RUN cat password.txt password.txt | vncpasswd && \
  rm password.txt
# Expose VNC port
EXPOSE 5901

COPY start.sh start.sh
