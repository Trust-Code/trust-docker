FROM ubuntu:16.04

ENV DEBIAN_FRONTEND noninteractive
ENV TERM=xterm
# Avoid ERROR: invoke-rc.d: policy-rc.d denied execution of start.
RUN echo "#!/bin/sh\nexit 0" > /usr/sbin/policy-rc.d

	##### Dependências #####

ADD conf/apt-requirements /opt/sources/
ADD conf/pip-requirements /opt/sources/
ADD http://download.gna.org/wkhtmltopdf/0.12/0.12.1/wkhtmltox-0.12.1_linux-trusty-amd64.deb /opt/sources/wkhtmltox.deb

WORKDIR /opt/sources/
RUN apt-get update && apt-get install -y nano python-dev python-pip locales
RUN pip install --upgrade pip
RUN apt-get install -y --no-install-recommends $(grep -v '^#' apt-requirements)
RUN npm install -g less less-plugin-clean-css

RUN pip install -r pip-requirements && \
    dpkg -i wkhtmltox.deb && \
    locale-gen en_US en_US.UTF-8 pt_BR.UTF-8 && \
    dpkg-reconfigure locales

	##### Repositórios TrustCode e OCB #####

RUN apt-get update && apt-get install -y supervisor git
WORKDIR /opt/odoo/
RUN git clone -b 8.0 http://github.com/odoo/odoo.git odoo
RUN mkdir private


	##### Configurações Odoo #####

ADD conf/supervisord.conf /etc/supervisor/supervisord.conf

RUN mkdir /var/log/odoo && \
    mkdir /opt/dados && \
    mkdir /opt/xml && \
    mkdir /opt/xml/imp && \
    mkdir /opt/xml/exp && \
    mkdir /opt/xml/bkp && \
    mkdir /var/log/supervisord && \
    touch /var/log/odoo/odoo.log && \
    touch /var/run/odoo.pid && \
    ln -s /opt/odoo/OCB/openerp-server /usr/bin/odoo-server && \
    ln -s /etc/odoo/odoo.conf && \
    ln -s /var/log/odoo/odoo.log && \
    useradd --system --home /opt --shell /bin/bash odoo && \
    chown -R odoo:odoo /opt && \
    chown -R odoo:odoo /var/log/odoo && \
    chown odoo:odoo /var/run/odoo.pid

	##### Limpeza da Instalação #####

RUN apt-get autoremove -y && \
    apt-get autoclean

	##### Finalização do Container #####

WORKDIR /opt/odoo
