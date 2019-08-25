# Overview

A docker image for administration of `RabbitMQ` (using `rabbitmqadmin`)

The container contains the following:

* [`rabbitmqadmin`](https://www.rabbitmq.com/management-cli.html) (Based on latest `RabbitMQ 3.7.17`)

## [Tags](https://hub.docker.com/r/vtchrispeterson/rabbitmqadmin/tags)

* `latest`

_In the future, additional tags may be used to allow clients to pin to specific functionality_

## Usage

Pull the docker image from *Docker Hub*:

```sh
docker pull vtchrispeterson/rabbitmqadmin
```

By default, this will pull the `latest` tag.

The entrypoint of this Docker image is `rabbitmqadmin`.

### Environment Variables

A few environment variables can be provided:

* `RABBIT_HOST`: IP or FQDN of the broker (default: `127.0.0.1`)
* `RABBIT_PORT`: port to access RabbitMQ at (default: `15672`)
* `RABBIT_USER`: username of the broker account (default: `guest`)
* `RABBIT_PASSWORD`: associated password (default: `guest`)
* `RABBIT_VHOST`: RabbitMQ virtual host (default: `/`)

### Examples

Here are some common examples for how you might use the container:

#### Example: List Queues

```sh
run -e RABBIT_HOST=rabbitmqserver \
   -e RABBIT_USER=admin -e RABBIT_PASSWORD=p@ssw0rd \
   vtchrispeterson/rabbitmqadmin list queues
```

#### Example: Export Configuration

```sh
docker run -e RABBIT_HOST=rabbitmqserver \
   -e RABBIT_USER=admin -e RABBIT_PASSWORD=p@ssw0rd \
   vtchrispeterson/rabbitmqadmin export config.json
```

#### Example: Show Overview

```sh
run -e RABBIT_HOST=rabbitmqserver \
   -e RABBIT_USER=admin -e RABBIT_PASSWORD=p@ssw0rd \
   vtchrispeterson/rabbitmqadmin show overview --format=pretty_json
```

## Local Development

To build the latest image from source, run

```sh
make
```

To get a list of commands supported by `rabbitmqadmin`, consult [documentation](https://www.rabbitmq.com/management-cli.html),
or run

```sh
make help
```
