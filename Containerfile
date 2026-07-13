FROM clamav/clamav:1.5.3@sha256:7f5389ccaa2368c383fa80e167ccfe44348d71e685f926fce4755eed1757673a

RUN chgrp -R 0 /var/log/clamav /var/lib/clamav/ \
 && chmod -R g+rwX /var/log/clamav /var/lib/clamav/

ENV FRESHCLAM_CHECKS=24
USER 30000
ENTRYPOINT ["/init-unprivileged"]
