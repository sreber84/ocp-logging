FROM fedora:latest
MAINTAINER Simon Reber <sreber@redhat.com>

RUN dnf -y --setopt=tsflags=nodocs update && \
    dnf -y --setopt=tsflags=nodocs install python && \
    dnf clean all

ADD app.py /opt/
ADD run.sh /opt/

CMD ["/opt/run.sh"]