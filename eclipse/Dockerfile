FROM trustcode/odoo-base

MAINTAINER	Mackilem Van der Laan <comercial@trustcode.com.br> \
		Danimar Ribeiro <desenvolvimento@trustcode.com.br>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y python-pip xvfb
RUN Xvfb :1 -screen 0 1024x768x16 &> xvfb.log  &

RUN pip install selenium && python
RUN apt-get install -y openjdk-7-jre
ADD eclipse* /opt/

RUN     useradd -d /home/developer/ -s /bin/bash developer && \
	mkdir /home/developer/ && \
	mkdir /home/developer/.eclipse

RUN     mkdir /home/Odoo && \
	chown -R developer:developer /opt/eclipse && \
	chown -R developer:developer /home && \
	chmod -R 775 /opt/eclipse

	##### Instalação do PySPED #####

RUN mkdir /tmp/.python-eggs && chown -R developer /tmp/.python-eggs
ENV PYTHON_EGG_CACHE /tmp/.python-eggs

USER developer
