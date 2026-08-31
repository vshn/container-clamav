FROM clamav/clamav:1.5.4@sha256:f0954d679017eb6d48221e2b2be3ac5457bf278a844f39b672376f55a085f591

RUN chgrp -R 0 /var/log/clamav /var/lib/clamav/ \
 && chmod -R g+rwX /var/log/clamav /var/lib/clamav/

ENV FRESHCLAM_CHECKS=24
USER 30000
ENTRYPOINT ["/init-unprivileged"]
