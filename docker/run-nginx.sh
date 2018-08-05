#!/usr/bin/env sh

cd ../
hugo
exec docker run --restart unless-stopped -d -p 80:80 -v $PWD/public:/usr/share/nginx/html:ro nginx
