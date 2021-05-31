FROM adoptopenjdk:16.0.1_9-jre-hotspot-focal

#ENV DEBIAN_FRONTEND="noninteractive"

LABEL maintainer="Phillip Tarrant <https://gitlab.com/Ptarrant1> and Dockerfile created by kevdagoat <https://gitlab.com/kevdagoat>"

RUN apt-get update
RUN apt-get install -y python3-dev default-libmysqlclient-dev build-essential python3-pip

COPY requirements.txt /crafty_web/requirements.txt
RUN pip3 install -r /crafty_web/requirements.txt

COPY ./ /crafty_web
WORKDIR /crafty_web

EXPOSE 8000
EXPOSE 25500-25600

CMD ["python3", "crafty.py", "-c", "/crafty_web/configs/docker_config.yml"]

