# NOTE: also update the renovate comment below if you change the minor version!
FROM docker.io/library/alpine:3.21.3@sha256:a8560b36e8b8210634f77d9f7f9efd7ffa463e380b75e2e74aff4511df3ef88c

# renovate: datasource=repology depName=alpine_3_21/clamav versioning=loose
ENV CLAMAV_VERSION="1.4.1-r0"

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
