FROM python:latest
LABEL maintainer="Markus Ritzmann <contact@dns42.ch>"

RUN apt-get update \
	&& apt-get -y upgrade \
	&& apt-get -y install dnsutils \
	&& pip3 install doh-proxy

EXPOSE 9000

ENTRYPOINT [ "doh-httpproxy", "--upstream-resolver=8.8.8.8", "--port", "9000", "--listen-address", "0.0.0.0" ]
