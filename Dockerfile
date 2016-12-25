FROM ikovacevic/java:oracle-jdk-8

MAINTAINER Jon Lancelle <bassoman@gmail.com>

RUN apt-get update && apt-get install -y curl wget unzip iputils-ping vim

ENV DEBIAN_FRONTEND noninteractive

ENV ACTIVATOR_VERSION 1.3.10

ENV ACTIVATOR_HOME /usr/local/activator

RUN \
  cd /tmp && \
  wget http://downloads.typesafe.com/typesafe-activator/$ACTIVATOR_VERSION/typesafe-activator-$ACTIVATOR_VERSION.zip && \
  unzip typesafe-activator-$ACTIVATOR_VERSION.zip -d /usr/local && \
  ln -s /usr/local/activator-dist-$ACTIVATOR_VERSION /usr/local/activator && \
  ln -s /usr/local/activator/bin/activator /usr/local/bin/ && \
  rm typesafe-activator-$ACTIVATOR_VERSION.zip

RUN apt-get update \
  && apt-get install -y python-software-properties python \
  && apt-get clean

RUN apt-get update \
  && apt-get install -y g++ make git \
  && apt-get clean

RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get install -y nodejs && apt-get clean
