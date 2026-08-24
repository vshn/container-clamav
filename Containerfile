FROM clamav/clamav:1.5.4@sha256:0e85467cb0d6e7d860a45035707741cd5ffc032ffefc6002a3510c75b6d07027

RUN chgrp -R 0 /var/log/clamav /var/lib/clamav/ \
 && chmod -R g+rwX /var/log/clamav /var/lib/clamav/

ENV FRESHCLAM_CHECKS=24
USER 30000
ENTRYPOINT ["/init-unprivileged"]
