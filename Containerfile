FROM clamav/clamav:1.5.3@sha256:24cab211a882e9f767b84b76afe197d82554306ad6d43b782f80cd6aa1e61427

RUN chgrp -R 0 /var/log/clamav /var/lib/clamav/ \
 && chmod -R g+rwX /var/log/clamav /var/lib/clamav/

ENV FRESHCLAM_CHECKS=24
USER 30000
ENTRYPOINT ["/init-unprivileged"]
