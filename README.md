# ClamAV Container Image

ClamAV container image Including the latest virus definitions DB.

## CI/CD Process


The deployed WAFs are configured with an [image change trigger](
https://docs.openshift.com/container-platform/3.11/dev_guide/managing_images.html#image-stream-kubernetes-resources
) and will therefore automatically roll out any new image.

## Scheduled Build

A scheduled build is set up so that each night at 04:00 (Zurich timezone) the image is rebuilt and pushed.
This ensures the virus definition DB stays up to date.

If you need to force a virus definition DB update a build can be triggered manually.

## Initial Setup (GitHub + OpenShift)

