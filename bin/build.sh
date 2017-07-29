#!/usr/bin/env sh
LOCK_FILE=/tmp/lock

touch /tmp/build.lock

mv -f /tmp/build.lock /tmp/build.lock.run
PACKAGE=`cat /tmp/build.lock.run`
echo ">>> buildng satis PACKAGE=$PACKAGE..."
/satis/bin/satis -vvv -n build /satis/satis.json /satis/web/ $PACKAGE
rm -rf /tmp/build.lock.run
