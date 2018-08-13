from ubuntu:16.04

RUN apt-get update \
  && apt-get install -y python3\
  python3-dev\
  python3-pip\
  python3-venv\
  nginx

WORKDIR /home/flask_production

COPY requirements.txt requirements.txt

RUN python3 -m venv venv
RUN venv/bin/pip install wheel
RUN venv/bin/pip install -r requirements.txt
RUN venv/bin/pip install uwsgi

COPY . .

RUN cp flask_production.nginx /etc/nginx/sites-available/flask_production
RUN ln -s /etc/nginx/sites-available/flask_production /etc/nginx/sites-enabled
