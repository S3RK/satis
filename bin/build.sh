#!/usr/bin/env sh

echo ">>> Sleep before build $DELAY_BEFORE_BUILD second(s)"
sleep $DELAY_BEFORE_BUILD
touch /tmp/build.lock

mv -f /tmp/build.lock /tmp/build.lock.run
PACKAGE=`cat /tmp/build.lock.run`
echo ">>> buildng satis PACKAGE=$PACKAGE..."
/satis/bin/satis -vvv -n build "$SATIS_CONFIG_FILE" /satis/web/ $PACKAGE

rm -rf /tmp/build.lock.run
