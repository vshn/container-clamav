#!/bin/sh

set -e

envsubst < /etc/clamav/clamd.conf.template > /etc/clamav/clamd.conf

exec "$@"
