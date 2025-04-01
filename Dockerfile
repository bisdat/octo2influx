FROM python:3.13-slim

LABEL maintainer="bisdat <octo2influx@noreply.github.com>"

WORKDIR /usr/src/app

# python Confuse requires the home to exist:
RUN useradd -u 9923 octo2influx --create-home
#COPY src/config.example.yaml config.yaml
COPY src/requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY src/octo2influx.py src/loop.sh ./

USER octo2influx

ENV FREQ=1h
ENTRYPOINT [ "bash", "loop.sh" ]
