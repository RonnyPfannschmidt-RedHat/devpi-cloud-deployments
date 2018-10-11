FROM fedora:28
RUN pip3 install devpi-server devpi-web
VOLUME /srv/devpi
ADD ./devpi-entry.sh /bin
WORKDIR /srv/devpi
ENTRYPOINT /bin/devpi-entry.sh