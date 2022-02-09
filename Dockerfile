FROM ubuntu:14.04

RUN mkdir -p /opt/webapp

COPY requirements.txt /tmp/
COPY app.py /opt/webapp
COPY Procfile /opt/webapp

RUN apt-get update && apt-get install -y python-all-dev python-pip
WORKDIR /tmp/ && pip install -qr requirements.txt

WORKDIR /opt/webapp/
EXPOSE 5000

CMD ["python", "./app.py"]
