#!/bin/bash

source /environment.sh

# initialize launch file
dt-launchfile-init

# YOUR CODE BELOW THIS LINE
# ----------------------------------------------------------------------------

# constants
HOSTNAME=$(hostname)
ROBOT_TYPE='device'
ROBOT_TYPE_FILE=/data/config/robot_type

# read robot type
if [ -f $ROBOT_TYPE_FILE ]; then
  ROBOT_TYPE=$(head -1 /data/config/robot_type)
fi

# gain access to dt-commons code
export PYTHONPATH="/code/dt-commons:$PYTHONPATH"

# configure \compose\
echo "Configuring \\compose\\ ..."
python3 $COMPOSE_DIR/configure.py \
  --navbar_title "${HOSTNAME}" \
  --website_name "${ROBOT_TYPE^} Dashboard" \
  --logo_white "http://${HOSTNAME}.local/data/duckietown/images/logo.png" \
  --logo_black "http://${HOSTNAME}.local/data/duckietown/images/logo.png"

dt-exec dt-advertise --name "DASHBOARD"

# ----------------------------------------------------------------------------
# YOUR CODE ABOVE THIS LINE

# run base entrypoint
dt-exec /entrypoint.sh

# terminate launch file
dt-launchfile-join