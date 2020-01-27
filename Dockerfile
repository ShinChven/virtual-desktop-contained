FROM ubuntu:bionic

## install tools

RUN apt-get update && apt-get upgrade -y \
&& apt-get install -y apt-utils make curl cmake vim tzdata \
&& ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
&& export DEBIAN_FRONTEND=noninteractive \
&& dpkg-reconfigure --frontend noninteractive tzdata \
&& export DEBIAN_FRONTEND=

## install desktop

RUN apt-get install -y gnome-session gdm3
RUN apt-get install -y tasksel
RUN tasksel install ubuntu-desktop

## install vnc

RUN apt-get -y install vnc4server
