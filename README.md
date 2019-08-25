# docker-rabbitmqadmin

A `rabbitmqadmin` docker image for administration of `RabbitMQ`.

The container contains the following:
* [`rabbitmqadmin`](https://www.rabbitmq.com/management-cli.html) (Based on latest `RabbitMQ 3.7.17`)

## Images
* `latest` ([Dockerfile](./Dockerfile))

## Usage
Pull the docker image from Docker hub as:
```
$ docker pull vtchrispeterson/rabbitmqadmin
```
By default, this will pull the latest image.

The entrypoint of this Docker image is `rabbitmqadmin`
which can be used by automated job schedulers directly.

A few environment variables can be provided to connect to
the broker as:

* `RABBIT_HOST`: reachable IP or FQDN of the broker (default: `127.0.0.1`)
* `RABBIT_PORT`: port to access RabbitMQ at (default: `15672`)
* `RABBIT_USER`: username of the broker account (default: `guest`)
* `RABBIT_PASSWORD`: associated password (default: `guest`)
* `RABBIT_VHOST`: RabbitMQ virtual host (default: `/`)

A sample execution:
```
$ docker run --rm vtchrispeterson/rabbitmqadmin:latest list queues
```

In other cases the entrypoint can be overriden as:

```
$ docker run --rm -it --entrypoint sh vtchrispeterson/rabbitmqadmin:latest
```

This will open up the `sh` shell.

## Build
To build the latest image from source, run
```
$ make latest
```
