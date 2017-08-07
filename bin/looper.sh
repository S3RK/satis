#!/usr/bin/env sh
echo '> Looping and waiting for build command'

while [ 1 ]
do
  if [ -f /tmp/build.lock ]; then
    /satis/bin/build.sh
  fi
  NGINX_IS_UP=`ps aux | grep nginx | grep -v grep | wc -l`
  if [[ "$NGINX_IS_UP" == "0" ]]; then
    echo ">>> Nginx is down!"
    exit 100
  fi
  sleep $LOOPER_PERIOD
done
