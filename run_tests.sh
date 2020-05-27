export PYTHONPATH=$(pwd) && /usr/sbin/httpd
apk add --no-cache curl && curl -fI 127.0.0.1/
