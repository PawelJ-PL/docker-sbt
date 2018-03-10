FROM openjdk:8-jdk-alpine3.7

MAINTAINER Pawel <inne.poczta@gmail.com>

ARG SBT_VERSION=1.1.1

RUN  adduser -u 999 -S -s /bin/bash -D -g 'SBT Docker user' sbt

RUN apk update && apk add bash && \
    wget -P /tmp/ https://github.com/sbt/sbt/releases/download/v1.1.1/sbt-${SBT_VERSION}.tgz && \
    tar -xzvpf /tmp/sbt-${SBT_VERSION}.tgz -C /usr/local/share/ && \
    ln -s /usr/local/share/sbt/bin/sbt /usr/local/bin/ && \
    rm -f /tmp/sbt-${SBT_VERSION}.tgz

USER sbt

WORKDIR /home/sbt

RUN sbt clean

CMD ["sbt"]