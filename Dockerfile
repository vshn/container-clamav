FROM docker.io/library/alpine:3.19

ENV CLAMD_LISTEN_PORT=3310 \
    CLAMAV_VERSION=1.2.2-r0

RUN apk add --no-cache \
      clamav-daemon=${CLAMAV_VERSION} \
      clamav-libunrar=${CLAMAV_VERSION} \
      gettext

COPY config/ /etc/clamav/

RUN chgrp -R 0 \
      /etc/clamav/ \
      /var/lib/clamav/ \
 && chmod -R g=u \
      /etc/clamav/ \
      /var/lib/clamav/ \
 && freshclam

COPY entrypoint.sh /usr/local/bin/

ENTRYPOINT [ "/usr/local/bin/entrypoint.sh"]
CMD [ "clamd" ]
