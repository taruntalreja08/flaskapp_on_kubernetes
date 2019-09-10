FROM python:stretch

LABEL maintainer="<amandeep.sachan@gmail.com>"

ENV LANG C.UTF-8

COPY . /app
WORKDIR /app

# install python packages and dependencies
RUN apt-get -yq update && \
    apt-get -yq upgrade && \
    apt-get -yq --no-install-recommends install \
        g++ && \
        pip install -r requirements.txt --no-cache-dir && \
    apt-get clean


EXPOSE 8080

ENTRYPOINT ["gunicorn", "--workers=2", "--bind", "0.0.0.0:8080", "--chdir=/app", "main:APP"]

