FROM ubuntu:14.04
ADD requirements.txt /tmp/
ADD app.py /opt/webapp
ADD Procfile /opt/webapp
RUN apt-get update && apt-get install -y python-all-dev python-pip
WORKDIR /tmp/ && pip install -qr requirements.txt

EXPOSE 5000

CMD ["/opt/webapp/app.py"]
