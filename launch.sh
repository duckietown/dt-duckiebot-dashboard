#!/bin/bash

set -e

# YOUR CODE BELOW THIS LINE
# ----------------------------------------------------------------------------

# constants
HOSTNAME=$(hostname)

# configure \compose\
echo "Configuring \\compose\\ ..."
python3 $COMPOSE_DIR/configure.py \
  --navbar_title "${HOSTNAME}" \
  --logo_white "http://${HOSTNAME}.local/data/duckietown/images/logo.png" \
  --logo_black "http://${HOSTNAME}.local/data/duckietown/images/logo.png"

# enable service
cp /dt.dashboad.service /etc/avahi-services/dt.dashboad.service

# ----------------------------------------------------------------------------
# YOUR CODE ABOVE THIS LINE

# run base entrypoint
/entrypoint.sh
