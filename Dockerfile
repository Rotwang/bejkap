FROM ubuntu:16.04

RUN set -x; \
        export DEBIAN_FRONTEND=noninteractive; \
        apt-get -qq -y update && \
        apt-get -qq -o=Dpkg::Use-Pty=0 install -y --no-install-recommends \
        nfs-common \
        apt-get -qq clean && \
        rm -rf /var/lib/apt/lists/* /tmp/*

COPY entrypoint /
ENTRYPOINT ["/entrypoint"]
