FROM registry.redhat.io/ubi8:latest
MAINTAINER Simon Reber <sreber@redhat.com>

USER root
# Copy entitlements
COPY ./etc-pki-entitlement /etc/pki/entitlement

# Copy subscription manager configurations
COPY ./rhsm-conf /etc/rhsm
COPY ./rhsm-ca /etc/rhsm/ca

RUN dnf -y --setopt=tsflags=nodocs update && \
    dnf -y --setopt=tsflags=nodocs install python && \
    dnf clean all

ADD app.py /opt/
ADD run.sh /opt/

RUN chmod 755 /opt/app.py
RUN chmod 755 /opt/run.sh

RUN sleep 9999

CMD ["/opt/run.sh"]
