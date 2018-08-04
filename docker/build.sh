#!/usr/bin/env sh

exec docker build --tag jagsgill/hugo:$1 --build-arg TAR_PATH="/tmp" --build-arg HUGO_PATH="/opt/gohugo" -f Dockerfile .

