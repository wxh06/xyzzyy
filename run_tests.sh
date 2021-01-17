#!/bin/sh
export PYTHONPATH && PYTHONPATH=$(pwd) && /usr/sbin/httpd
apk add --no-cache curl && curl -fI 127.0.0.1/ 127.0.0.1/node_modules/jquery/dist/jquery.slim.min.js
