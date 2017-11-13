#!/bin/sh

if [ "${#}" -ne 1 ]; then
  echo "Usage docker-run.sh username [version]"
  exit 1
fi

USERNAME=${1}
VERSION=${2}
REGION=${3}
if [ -z ${2} ]; then
  VERSION=latest
fi

IMAGEURL=${USERNAME}/echo-chamber:${VERSION}

echo "Will run ${IMAGEURL}"
docker run -dt -p 80:3000 -e REGION=${REGION} ${USERNAME}/echo-chamber:${VERSION}