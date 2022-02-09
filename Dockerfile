FROM ubuntu:14.04

RUN apt-get update && apt-get install -y git python-flask python-all-dev python-pip

RUN mkdir -p /root/.ssh
ADD id_rsa /root/.ssh/id_rsa
RUN chmod 700 /root/.ssh/id_rsa
RUN echo "Host github.com\n\tStrictHostKeyChecking no\n" >> /root/.ssh/config

RUN mkdir -p /opt/webapp
WORKDIR /tmp/
RUN git clone git@github.com:RaulFTW/app.git

RUN cp requirements.txt /tmp/
RUN cp app.py /opt/webapp
RUN cp Procfile /opt/webapp
RUN pip install -qr requirements.txt

WORKDIR /opt/webapp/
EXPOSE 5000

CMD ["python", "./app.py"]
