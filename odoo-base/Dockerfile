FROM ubuntu:trusty

ENV DEBIAN_FRONTEND noninteractive

	##### Dependências #####

ADD apt-requirements /opt/sources/
ADD pip-requirements /opt/sources/
ADD http://download.gna.org/wkhtmltopdf/0.12/0.12.1/wkhtmltox-0.12.1_linux-trusty-amd64.deb /opt/sources/wkhtmltox.deb

WORKDIR /opt/sources/
RUN apt-get update && apt-get install -y python-dev locales
RUN apt-get install -y --no-install-recommends $(grep -v '^#' apt-requirements)

RUN apt-get install -y npm &&
    ln -s /usr/bin/nodejs /usr/bin/node &&
    npm install -g less less-plugin-clean-css

RUN pip install -r pip-requirements && \
    dpkg -i wkhtmltox.deb && \
    locale-gen en_US en_US.UTF-8 pt_BR.UTF-8 && \
    dpkg-reconfigure locales

	##### Instala Postgresql-client #####

ADD https://www.postgresql.org/media/keys/ACCC4CF8.asc ./chave.asc
RUN apt-key add chave.asc
RUN echo 'deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main' 9.4 > /etc/apt/sources.list.d/pgdg.list

RUN apt-get update && apt-get install postgresql-client-9.4 -y
