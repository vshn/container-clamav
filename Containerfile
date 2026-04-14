FROM clamav/clamav:1.5.2@sha256:c6eb128c7bd57bb0c533491198753a2130b471c517605ad8d289174a56c450a8

RUN chgrp -R 0 /var/log/clamav /var/lib/clamav/ \
 && chmod -R g+rwX /var/log/clamav /var/lib/clamav/

ENV FRESHCLAM_CHECKS=24
USER 30000
ENTRYPOINT ["/init-unprivileged"]
