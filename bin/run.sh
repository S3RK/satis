#!/usr/bin/env sh
echo -e "Host *\n\tStrictHostKeyChecking no\n" > ~/.ssh/config
chmod 400 ~/.ssh/config

echo '> Starting Nginx'
nginx

/satis/bin/looper.sh
