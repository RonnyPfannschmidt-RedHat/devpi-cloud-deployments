FROM registry.fedoraproject.org/fedora-minimal

ENV DEVPI_WORKDIR=/srv/devpi

EXPOSE 3141

RUN microdnf install python3-pip && \
    microdnf clean all && \
    pip3 install devpi-server devpi-web devpi-postgresql

COPY devpi-entry.sh /bin

WORKDIR $DEVPI_WORKDIR

VOLUME $DEVPI_WORKDIR

ENTRYPOINT ["/bin/devpi-entry.sh"]
