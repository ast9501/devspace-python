FROM docker.io/python:3.8.19-slim-bullseye

RUN apt update && \
    apt install -y vim git bash openssh-server && \
    mkdir /app && \
    mkdir /root/.ssh
COPY ./requirements.txt /root/requirements.txt
RUN cd /root && \
    pip install --no-cache-dir -r requirements.txt && \
    rm /root/requirements.txt

WORKDIR /app
