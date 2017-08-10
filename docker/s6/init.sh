#!/bin/sh

echo "Starting all services...";

# Logshipper setup needs a application specific folder for logs to keep clean state.
mkdir -p /srv/log/picocms/
touch /srv/log/picocms/phperror.log
chmod 777 -R /srv/log/picocms/