#!/usr/bin/env sh

cd ../
hugo
exec docker run -d -p 80:80 -v $PWD/public:/usr/share/nginx/html:ro nginx
