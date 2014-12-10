FROM ubuntu:14.10

RUN apt-get update && apt-get install -y --no-install-recommends python python-pip python-geoip \ 
	python-gevent python-ldap python-lxml python-markupsafe python-pil python-pip \
	python-psutil python-psycopg2 python-pychart python-pydot \
	python-reportlab python-simplejson python-yaml wget wkhtmltopdf


