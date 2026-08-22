FROM clamav/clamav:1.5.4@sha256:15167977085b01d083812d42aa70d390c2e3fcaaf647dfe82a47328fa6d48c9c

RUN chgrp -R 0 /var/log/clamav /var/lib/clamav/ \
 && chmod -R g+rwX /var/log/clamav /var/lib/clamav/

ENV FRESHCLAM_CHECKS=24
USER 30000
ENTRYPOINT ["/init-unprivileged"]
