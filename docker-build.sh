#!/bin/sh

if [ "${#}" -ne 2 ]; then
  echo "Local build only"
fi

docker build -t echo-chamber:latest .

USERNAME=${1}
PASSWORD=${2}
VERSION=`cat package.json | jq .version | sed s/\"//g`

echo "Will build echo-chamber ${VERSION}"
docker tag echo-chamber:latest echo-chamber:${VERSION}
docker tag echo-chamber:latest ${USERNAME}/echo-chamber:latest
docker tag echo-chamber:latest ${USERNAME}/echo-chamber:${VERSION}
docker login -u ${USERNAME} -p ${PASSWORD}
docker push ${USERNAME}/echo-chamber:latest
docker push ${USERNAME}/echo-chamber:${VERSION}