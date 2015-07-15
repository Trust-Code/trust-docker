FROM trustcode/odoo-base

MAINTAINER	Mackilem Van der Laan <comercial@trustcode.com.br> \
		Danimar Ribeiro <desenvolvimento@trustcode.com.br>

ENV DEBIAN_FRONTEND noninteractive

	##### Repositórios TrustCode e OCB #####

RUN apt-get update && apt-get install -y nginx supervisor git
WORKDIR /opt/odoo/
RUN git clone --depth=1 http://github.com/OCA/OCB.git OCB
RUN git clone --depth=1 http://github.com/Trust-Code/odoo-brazil-eletronic-documents.git eletronic-docs
RUN git clone --depth=1 http://github.com/Trust-Code/l10n-brazil.git l10n-brazil
RUN git clone --depth=1 http://github.com/Trust-Code/account-fiscal-rule.git fiscal-rule
RUN git clone --depth=1 http://github.com/Trust-Code/trust-addons.git trust-addons
RUN git clone --depth=1 http://github.com/Trust-Code/server-tools.git server-tools
RUN mkdir private
WORKDIR /opt

	##### Configurações Odoo #####

ADD conf/odoo.conf /etc/odoo/
ADD conf/nginx.conf /etc/nginx/
ADD conf/supervisord.conf /etc/supervisor/supervisord.conf

RUN mkdir /var/log/odoo && \
    mkdir /opt/dados && \
    touch /var/log/odoo/odoo.log && \
    touch /var/run/odoo.pid && \
    ln -s /opt/odoo/OCB/openerp-server /usr/bin/odoo-server && \
    useradd --system --home /opt --shell /bin/bash odoo && \
    chown -R odoo:odoo /opt/odoo && \
    chown -R odoo:odoo /etc/odoo/odoo.conf && \
    chown -R odoo:odoo /opt/dados && \
    chown -R odoo:odoo /var/log/odoo && \
    chown odoo:odoo /var/run/odoo.pid

	##### Limpeza da Instalação #####

RUN apt-get --purge remove -y python-pip git && \
    apt-get autoremove -y && \
    apt-get autoclean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /opt/sources/

	##### Finalização do Container #####

VOLUME ["/opt/", "/etc/odoo", "/var/log/odoo"]
CMD ["/usr/bin/supervisord"]
