FROM alpine


RUN [ "apk", "add", "--no-cache", "openrc", "apache2-mod-wsgi", "py3-pip", "git" ]

COPY . /var/www/localhost/wsgi-scripts/xyzzyy
RUN cat /var/www/localhost/wsgi-scripts/xyzzyy/apache2.conf >> /etc/apache2/httpd.conf
RUN pip3 install -r /var/www/localhost/wsgi-scripts/xyzzyy/requirements.txt


CMD export PYTHONPATH=/var/www/localhost/wsgi-scripts/xyzzyy && /usr/sbin/httpd && /bin/sh
