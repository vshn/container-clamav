FROM clamav/clamav:1.5.3@sha256:e5fe207ce8003f7d9d1988b26f862679b72e0ede544b7d095a22e4d569cfd62b

RUN chgrp -R 0 /var/log/clamav /var/lib/clamav/ \
 && chmod -R g+rwX /var/log/clamav /var/lib/clamav/

ENV FRESHCLAM_CHECKS=24
USER 30000
ENTRYPOINT ["/init-unprivileged"]
