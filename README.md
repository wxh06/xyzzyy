# xyzzyy
[![Python package](https://github.com/wxh06/xyzzyy/workflows/Python%20package/badge.svg)](https://github.com/wxh06/xyzzyy/actions?query=workflow%3A%22Python+package%22)
[![Node.js CI](https://github.com/wxh06/xyzzyy/workflows/Node.js%20CI/badge.svg)](https://github.com/wxh06/xyzzyy/actions?query=workflow%3A%22Node.js+CI%22)
[![Docker](https://github.com/wxh06/xyzzyy/workflows/Docker/badge.svg)](https://github.com/wxh06/xyzzyy/actions?query=workflow%3A%22Docker%22)
[![Build Status](https://www.travis-ci.org/wxh06/xyzzyy.svg)](https://www.travis-ci.org/wxh06/xyzzyy)
[![Docker Cloud Automated build](https://img.shields.io/docker/cloud/automated/wangxinhe/xyzzyy?logo=docker)](https://hub.docker.com/r/wangxinhe/xyzzyy/builds)
[![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/wangxinhe/xyzzyy?logo=docker)](https://hub.docker.com/r/wangxinhe/xyzzyy/builds)
[![License](https://img.shields.io/github/license/wxh06/xyzzyy.svg?logo=github)](https://github.com/wxh06/xyzzyy/blob/master/LICENSE)

校园智障英语

## Installation
### Via [Docker](https://www.docker.com/)
#### From [Docker Hub](https://hub.docker.com/)
[wangxinhe/xyzzyy - Docker Hub](https://hub.docker.com/r/wangxinhe/xyzzyy)
```sh
docker pull wangxinhe/xyzzyy
```

#### From [GitHub Packages](https://github.com/features/packages)
[Package xyzzyy · wxh06/xyzzyy](https://github.com/wxh06/xyzzyy/packages/242235)
```sh
docker pull docker.pkg.github.com/wxh06/xyzzyy/xyzzyy:latest
```

### From [source](https://github.com/wxh06/xyzzyy)
1. Clone via [Git](https://www.git-scm.com/)
```sh
git clone https://github.com/wxh06/xyzzyy.git
```

2. Install Dependencies via [pip](https://pip.pypa.io/) & [npm](https://www.npmjs.com/)
```sh
pip install -r requirements.txt
npm i
```

## Usage
### [Flask](https://palletsprojects.com/p/flask/)
```sh
export FLASK_APP=app.py
python -m flask run
```
Then head over to <http://127.0.0.1:5000/>.

### [Apache HTTP Server](https://httpd.apache.org/) via [mod_wsgi](https://www.modwsgi.org/)
```apacheconf
WSGIScriptAlias / /path/to/xyzzyy/wsgi.py
```

### Apache HTTPD in Docker
If you've already pulled the Docker image, try
```sh
docker run -d -p 8080:80 -t wangxinhe/xyzzyy
```

Then you'll get:
```http
$ curl -I 127.0.0.1:8080/
HTTP/1.1 200 OK
Date: ...
Server: Apache/2.4 (Unix)
Content-Length: ...
Last-Modified: ...
Cache-Control: public, max-age=43200
Expires: ...
ETag: "..."
Content-Type: text/html; charset=utf-8
```
