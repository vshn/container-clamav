FROM clamav/clamav:1.5.2@sha256:898c176d1cfec61d4585f71d1e2e8515b3cc8d5f83cd9fc2f6748e8b20de82a2

RUN chgrp -R 0 /var/log/clamav /var/lib/clamav/ \
 && chmod -R g+rwX /var/log/clamav /var/lib/clamav/

ENV FRESHCLAM_CHECKS=24
USER 30000
ENTRYPOINT ["/init-unprivileged"]
