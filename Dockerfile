# NOTE: also update the renovate comment below if you change the minor version!
FROM docker.io/library/alpine:3.23.3@sha256:25109184c71bdad752c8312a8623239686a9a2071e8825f20acb8f2198c3f659

# renovate: datasource=repology depName=alpine_3_23/clamav versioning=loose
ENV CLAMAV_VERSION="1.4.3-r2"

RUN apk add --no-cache \
      clamav-daemon=${CLAMAV_VERSION} \
      clamav-libunrar=${CLAMAV_VERSION} 

COPY config/ /etc/clamav/
COPY run-freshclam-clamd.sh /usr/local/bin/

RUN chgrp -R 0 \
      /etc/clamav/ \
      /var/lib/clamav/ \
 && chmod -R g=u \
      /etc/clamav/ \
      /var/lib/clamav/

# Interval in seconds to run freshclam
ENV FRESHCLAM_INTERVAL=3600

CMD [ "/usr/local/bin/run-freshclam-clamd.sh" ]
