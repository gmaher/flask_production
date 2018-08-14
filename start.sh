#!/bin/bash

#fail if any command in this script fails
set -eu

echo "RUNNING SUPERVISOR"
supervisord
