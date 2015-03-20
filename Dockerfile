FROM ubuntu:14.10
MAINTAINER Danimar Ribeiro <danimaribeiro@gmail.com>

RUN apt-get update && apt-get install -y --no-install-recommends python-dateutil python-feedparser python-gdata python-ldap \
	python-libxslt1 python-mako python-mock python-openid python-psycopg2 \
	python-pybabel python-pychart python-pydot python-pyparsing python-reportlab \
	python-simplejson python-tz python-vatnumber python-vobject python-webdav python-matplotlib \
	python-werkzeug python-xlwt python-yaml python-zsi python-yaml python-cups python-dev \
	libxmlsec1-dev libxml2-dev python-setuptools python-lxml python-decorator python-passlib \
	bzr git nginx libxmlsec1-dev libxml2-dev --yes

RUN apt-get install python-pip --yes

RUN pip install unittest2 psutil jinja2 docutils requests pypdf https://github.com/aricaldeira/pyxmlsec/archive/master.zip \
	https://github.com/aricaldeira/geraldo/archive/master.zip 

RUN pip install pysped --allow-external PyXMLSec --allow-insecure PyXMLSec

RUN adduser --system --home /home/trustcode --group --shell /bin/bash trustcode

USER trustcode
RUN mkdir /home/trustcode/odoo
WORKDIR /home/trustcode/odoo

RUN git clone https://github.com/odoo/odoo.git && cd odoo && git checkout 8.0 && cd ..
RUN git clone https://github.com/odoo-brazil/l10n-brazil.git && cd l10n-brazil && git checkout 8.0 && cd ..
RUN git clone https://github.com/odoo-brazil/odoo-brazil-eletronic-documents.git nfe && cd nfe && git checkout 8.0 && cd ..
RUN git clone https://github.com/odoo-brazil/account-fiscal-rule.git && cd account-fiscal-rule && git checkout develop && cd ..

USER root
RUN pip install pillow

USER trustcode

EXPOSE 8069

RUN cd odoo && ./openerp-server --addons-path=addons,openerp/addons,../l10n-brazil,../nfe,../account-fiscal-rule

