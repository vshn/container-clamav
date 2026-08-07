FROM clamav/clamav:1.5.4@sha256:0af8760cd96f9ab67d07977af36e155431581a9fe9f0ec8b256c9f855fda183e

RUN chgrp -R 0 /var/log/clamav /var/lib/clamav/ \
 && chmod -R g+rwX /var/log/clamav /var/lib/clamav/

ENV FRESHCLAM_CHECKS=24
USER 30000
ENTRYPOINT ["/init-unprivileged"]
