FROM alpine

MAINTAINER Chris Peterson "vtchrispeterson@gmail.com"

ADD bin/* /usr/bin/

RUN apk update &&\
  apk add --update curl python jq &&\
  curl https://raw.githubusercontent.com/rabbitmq/rabbitmq-management/v3.7.17/bin/rabbitmqadmin -o /usr/bin/rabbitmqadmin &&\
  chmod +x /usr/bin/rabbitmqadmin &&\
  chmod +x /usr/bin/rmqa

# default configuration
ENV RABBIT_HOST=127.0.0.1 \
  RABBIT_PORT=15672 \
  RABBIT_USER=guest \
  RABBIT_PASSWORD=guest

CMD ["rmqa", "show overview"]
