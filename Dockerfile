FROM ubuntu:14.04

RUN apt-get update && apt-get install -y git python-flask python-all-dev python-pip

RUN mkdir -p /opt/webapp
WORKDIR /tmp/app
RUN git clone git@github.com:RaulFTW/app.git

RUN cp requirements.txt /tmp/
RUN cp app.py /opt/webapp
RUN cp Procfile /opt/webapp

WORKDIR /tmp/ && pip install -qr requirements.txt

WORKDIR /opt/webapp/
EXPOSE 5000

CMD ["python", "./app.py"]
