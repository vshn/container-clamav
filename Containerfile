FROM clamav/clamav:1.5.4@sha256:9cb27d7660bdf66e9878c832cb433dd8aa152cfbe16f3c2c0084c80b04ae22b4

RUN chgrp -R 0 /var/log/clamav /var/lib/clamav/ \
 && chmod -R g+rwX /var/log/clamav /var/lib/clamav/

ENV FRESHCLAM_CHECKS=24
USER 30000
ENTRYPOINT ["/init-unprivileged"]
