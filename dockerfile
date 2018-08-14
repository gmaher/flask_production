from ubuntu:16.04

RUN useradd -ms /bin/bash nginx_user

WORKDIR /home/nginx_user/flask_production

RUN apt-get update \
  && apt-get install -y python3\
  python3-dev\
  python3-pip\
  python3-venv\
  nginx\
  curl\
  supervisor

COPY requirements.txt requirements.txt

RUN python3 -m venv venv \
    && venv/bin/pip install wheel \
    && venv/bin/pip install -r requirements.txt \
    && venv/bin/pip install uwsgi

COPY . .

RUN cp flask_production.nginx /etc/nginx/sites-available/flask_production \
    && ln -s /etc/nginx/sites-available/flask_production /etc/nginx/sites-enabled \
    && rm /etc/nginx/sites-enabled/default

RUN mkdir -p /var/log/supervisor

RUN chmod +x start.sh

RUN chown -R nginx_user:www-data /var /etc /home /run

USER nginx_user

EXPOSE 8999

CMD ["./start.sh"]
