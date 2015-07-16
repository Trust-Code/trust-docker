FROM trustcode/odoo-base

MAINTAINER	Mackilem Van der Laan <comercial@trustcode.com.br> \
		Danimar Ribeiro <desenvolvimento@trustcode.com.br>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y python-pip xvfb
RUN Xvfb :1 -screen 0 1024x768x16 &> xvfb.log  &

RUN pip install selenium && python
ADD http://eclipse.c3sl.ufpr.br/technology/epp/downloads/release/mars/R/eclipse-jee-mars-R-linux-gtk-x86_64.tar.gz /opt/eclipse
RUN apt-get install -y openjdk-7-jre

RUN useradd -d /home/developer/ -s /bin/bash developer && \
	mkdir /home/developer/ && \
	mkdir /home/developer/.eclipse

RUN chown -R developer:developer /opt/eclipse && \
	mkdir /home/Odoo && \
	chown -R developer:developer /home && \
	chown -R 775 /opt/eclipse

USER developer
