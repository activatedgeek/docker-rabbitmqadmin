FROM rabbitmq:3-management

LABEL maintainer="vtchrispeterson@gmail.com"

ADD bin/* /usr/bin/

RUN apt-get update; \
  apt-get install -y curl jq

RUN chmod +x /usr/bin/rmq*

# default configuration
ENV RABBIT_HOST=127.0.0.1 \
  RABBIT_PORT=15672 \
  RABBIT_USER=guest \
  RABBIT_PASSWORD=guest

CMD ["rmq", "help"]
