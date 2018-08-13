#!/bin/bash

#fail if any command in this script fails
set -eu

echo "RUNNING uWSGI server in detached mode"
./venv/bin/uwsgi -d --ini flask_production.ini

echo "STARTING NGINX SERVER"
nginx
