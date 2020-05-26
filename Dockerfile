FROM alpine


RUN [ "apk", "add", "apache2-mod-wsgi", "py3-pip", "git" ]

COPY . /var/www/xyzzyy
RUN cat /var/www/xyzzyy/apache2.conf >> /etc/apache2/httpd.conf
RUN pip3 install -r /var/www/xyzzyy/requirements.txt


ENTRYPOINT [ "rc-service", "apache2", "start" ]
