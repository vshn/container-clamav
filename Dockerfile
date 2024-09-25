# NOTE: also update the renovate comment below if you change the minor version!
FROM docker.io/library/alpine:3.20.3@sha256:a8f120106f5549715aa966fd7cefaf3b7045f6414fed428684de62fec8c2ca4b

# renovate: datasource=repology depName=alpine_3_20/clamav versioning=loose
ENV CLAMAV_VERSION="1.2.2-r0"

RUN apk add --no-cache \
      clamav-daemon=${CLAMAV_VERSION} \
      clamav-libunrar=${CLAMAV_VERSION} 

COPY config/ /etc/clamav/

RUN chgrp -R 0 \
      /etc/clamav/ \
      /var/lib/clamav/ \
 && chmod -R g=u \
      /etc/clamav/ \
      /var/lib/clamav/ \
 && freshclam


CMD [ "clamd" ]
