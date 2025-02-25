#!/bin/sh

echo '---> Initial update of virus database'
freshclam | sed 's/^/[freshclam] /'

echo '---> Starting clamd'
clamd &

while true; do
  echo "---> Sleeping for ${FRESHCLAM_INTERVAL:-3600} seconds"
  sleep ${FRESHCLAM_INTERVAL:-3600}

  echo '---> Updating virus database'
  freshclam | sed 's/^/[freshclam] /'
done
