#!/usr/bin/env sh
set -e

if [ -f /tmp/build.lock ] && [[ "$FORCE_SCHEDULE" != "1" ]]; then
  PACKAGE=`cat /tmp/build.lock`
  echo "<ERROR>"
  echo ">>> Build already has been scheduled - no overlaps! PACKAGE=$PACKAGE FORCE_SCHEDULE=$FORCE_SCHEDULE"
  exit 400
fi

echo "<SUCCESS>"
echo ">>> New build scheduled! PACKAGE=$PACKAGE FORCE_SCHEDULE=$FORCE_SCHEDULE"
echo "$PACKAGE" > /tmp/build.lock
exit 0
