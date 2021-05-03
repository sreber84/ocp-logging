FROM registry.redhat.io/ubi8:latest
MAINTAINER Simon Reber <sreber@redhat.com>

USER root
# Copy entitlements
COPY ./etc-pki-entitlement /etc/pki/entitlement
# Copy subscription manager configurations
# COPY ./rhsm-conf /etc/rhsm
# COPY ./rhsm-ca /etc/rhsm/ca
# Delete /etc/rhsm-host to use entitlements from the build container
RUN rm /etc/rhsm-host && \
    # Initialize /etc/yum.repos.d/redhat.repo
    # See https://access.redhat.com/solutions/1443553
    yum -v repolist --disablerepo=* && \
    subscription-manager repos --enable rhel-8-for-x86_64-baseos-rpms && \
    yum -v -y update && \
    yum -v -y install python38 && \
    # Remove entitlements and Subscription Manager configs
    rm -rf /etc/pki/entitlement && \
    rm -rf /etc/rhsm

ADD app.py /opt/
ADD run.sh /opt/

RUN chmod 755 /opt/app.py
RUN chmod 755 /opt/run.sh

RUN sleep 9999

CMD ["/opt/run.sh"]
