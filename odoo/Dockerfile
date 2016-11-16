FROM trustcode/docker-odoo-base 

ADD conf/supervisord.conf /etc/supervisor/supervisord.conf
ADD http://download.gna.org/wkhtmltopdf/0.12/0.12.1/wkhtmltox-0.12.1_linux-trusty-amd64.deb /opt/sources/temp.deb

RUN apt-get install -y postgresql-client python-libxml2
RUN rm /opt/sources/temp.deb
RUN pip install --no-cache-dir pytrustnfe python-cnab python-boleto

WORKDIR /opt/odoo
RUN chown -R odoo:odoo /opt
RUN apt-get clean
    
USER odoo
CMD ["/usr/bin/supervisord"]
