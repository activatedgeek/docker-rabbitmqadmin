FROM rabbitmq:3.11.2-management

LABEL maintainer="chrispeterson@fastmail.com"

ADD bin/* /usr/bin/

RUN apt-get update; \
  apt-get install -y curl jq

RUN chmod +x /usr/bin/rmq*

RUN cd $HOME; echo 'default cookie' > .erlang.cookie; chown rabbitmq .erlang.cookie; chmod 600 .erlang.cookie

# default configuration
ENV RABBIT_HOST=127.0.0.1 \
  RABBIT_PORT=15672 \
  RABBIT_USER=guest \
  RABBIT_PASSWORD=guest

CMD ["rmq", "help"]
