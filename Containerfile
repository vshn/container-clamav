FROM clamav/clamav:1.5.4@sha256:0e31ce089574268aefa0b543767d66b70240ab51ed49eec53e07f18d5629d817

RUN chgrp -R 0 /var/log/clamav /var/lib/clamav/ \
 && chmod -R g+rwX /var/log/clamav /var/lib/clamav/

ENV FRESHCLAM_CHECKS=24
USER 30000
ENTRYPOINT ["/init-unprivileged"]
