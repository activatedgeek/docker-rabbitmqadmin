#!/usr/bin/env sh

# assign defaults
RABBIT_HOST=${RABBIT_HOST:-127.0.0.1}
RABBIT_PORT=${RABBIT_PORT:-15672}
RABBIT_USER=${RABBIT_USER:-guest}
RABBIT_PASSWORD=${RABBIT_PASSWORD:-guest}
RABBIT_VHOST=${RABBIT_VHOST:-/}

# assign some vars from global variables and rest take from "CMD"
/usr/bin/rabbitmqadmin -H $RABBIT_HOST -V $RABBIT_VHOST -P $RABBIT_PORT -u $RABBIT_USER -p $RABBIT_PASSWORD $@
