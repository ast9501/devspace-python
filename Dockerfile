FROM docker.io/python:3.8.19-slim-bullseye

RUN apt update && \
    apt install -y vim git bash openssh-server && \
    mkdir /app && \
    mkdir /root/.ssh

WORKDIR /app
