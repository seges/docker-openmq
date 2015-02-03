FROM java:8-jdk
MAINTAINER Ladislav Gazo <gazo@seges.sk>

ENV OPENMQ_VERSION 4.5
ENV OPENMQ_ARCHIVE openmq4_5-binary-Linux_X86.zip
RUN useradd -d /home/openmq -u 1001 -s /bin/bash openmq && \
    mkdir -p /usr/local/openmq && \
    chown -R openmq:openmq /usr/local/openmq

USER openmq
RUN cd /usr/local/openmq && \
    curl -v -o $OPENMQ_ARCHIVE http://download.java.net/mq/open-mq/$OPENMQ_VERSION/b29-fcs/$OPENMQ_ARCHIVE && \
    unzip $OPENMQ_ARCHIVE

EXPOSE 7676

CMD ["/usr/local/openmq/MessageQueue4_5/mq/bin/imqbrokerd", "-vmargs", "-Xss228m"]

