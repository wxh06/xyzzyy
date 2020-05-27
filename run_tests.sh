export PYTHONPATH=$(pwd) && /usr/sbin/httpd
apk add --no-cache curl && curl -f 127.0.0.1/
