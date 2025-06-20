ARG BUILD_FROM=python:3.10-slim
FROM ${BUILD_FROM} AS build

# install git & pip
RUN apt-get update \
  && apt-get install -y --no-install-recommends git gcc \
  && pip install --upgrade pip

# clone official Tronbyt Server
ARG TRONBYT_REPO=https://github.com/tronbyt/server.git
RUN git clone ${TRONBYT_REPO} /app

WORKDIR /app
RUN pip install -r requirements.txt

#####################################
FROM python:3.10-slim

# create folders (Supervisor will mount these)
RUN mkdir -p /config /ssl /media

WORKDIR /app
COPY --from=build /usr/local/lib/python3.10/site-packages /usr/local/lib/python3.10/site-packages
COPY --from=build /app /app
COPY run.sh /run.sh
RUN chmod +x /run.sh

CMD [ "/run.sh" ]

