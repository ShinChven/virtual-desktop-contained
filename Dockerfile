FROM ubuntu:bionic

COPY sources.163.list /etc/apt/sources.list

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get upgrade -y \
&& apt-get install -y apt-utils vim firefox \
xfce4 xserver-xorg-core xfce4-terminal tigervnc-standalone-server tigervnc-xorg-extension tigervnc-viewer

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
