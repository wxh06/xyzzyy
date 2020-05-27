FROM alpine


RUN [ "apk", "add", "--no-cache", "apache2-mod-wsgi", "py3-pip", "git" ]

WORKDIR /var/www/localhost/wsgi-scripts/xyzzyy
COPY . .
RUN mv apache2.conf /etc/apache2/conf.d/xyzzyy.conf
RUN pip3 install -r requirements.txt


EXPOSE 80

CMD export PYTHONPATH=$(pwd) && /usr/sbin/httpd && /bin/sh
