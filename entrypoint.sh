#!/bin/sh
gunicorn --bind 0.0.0.0:8000 --worker-class eventlet -w 1 main:app
