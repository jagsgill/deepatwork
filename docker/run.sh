#!/usr/bin/env sh

exec docker run \
	-d \
	-p 80:80 \
	-v deep-at-work-site:/deep-at-work-site \
	jagsgill/hugo:$1



