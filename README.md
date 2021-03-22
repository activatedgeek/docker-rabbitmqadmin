# Overview

A docker image for administration of `RabbitMQ` (using `rabbitmqadmin` and/or `rabbitmqctl`)

The container contains the following:

* [rabbitmqadmin](https://www.rabbitmq.com/management-cli.html) (based on _RabbitMQ 3.8.*_)
* [rabbitmqctl](https://www.rabbitmq.com/rabbitmqctl.8.html)
* [jq](https://stedolan.github.io/jq/) - command line JSON processor
* [python](https://www.python.org/) - needed to support `rabbitmqadmin`

The default `CMD` is `rmq` which invokes `rabbitmqctl` honoring [environment varibles](#environment-variables).

### Environment Variables

A few environment variables can be provided:

| name | default | description |
| --- | --- | --- |
| `RABBIT_ECHO` | `<unset>` (disabled) | If set, commands are echoed to console |
| `RABBIT_HOST` | `127.0.0.1` | IP or FQDN of the RabbitMQ server |
| `RABBIT_PORT` | `15672` | Management port of the RabbitMQ server |
| `RABBIT_USER`/`RABBIT_PASSWORD` | `guest` | Administrator username/password (used by rmqa)|
| `RABBIT_ERLANG_COOKIE` | `<unset>` | Erlang cookie (used by rmq) |

### Examples

The following are some common examples for how you might use the container.

#### Example: List Queues

```sh
docker run -e RABBIT_HOST=rabbitmqserver \
   -e RABBIT_USER=admin -e RABBIT_PASSWORD=p@ssw0rd \
   vtchrispeterson/rabbitmqadmin rmqa list queues
```

#### Example: Export Configuration

```sh
docker run -e RABBIT_HOST=rabbitmqserver \
   -e RABBIT_USER=admin -e RABBIT_PASSWORD=p@ssw0rd \
   vtchrispeterson/rabbitmqadmin rmqa export config.json
```

#### Example: Show Overview

```sh
docker run -e RABBIT_HOST=rabbitmqserver \
   -e RABBIT_USER=admin -e RABBIT_PASSWORD=p@ssw0rd \
   vtchrispeterson/rabbitmqadmin rmqa show overview --format=pretty_json
```

#### Example: GitLab CI

```yml
stages:
- snapshot
- deploy
- rollback

image: vtchrispeterson/rabbitmqadmin

variables:
  RABBIT_USER: admin
  RABBIT_PASSWORD: p@ssw0rd

.snapshot:
  stage: snapshot
  script: rmqa export $RABBIT_HOST.config
  artifacts:
    paths:
    - $RABBIT_HOST.config
    expire_in: 1 week

.deploy:
  stage: deploy
  script: scripts/deploy.sh
  when: manual

.rollback:
  stage: rollback
  script: rmqa import $RABBIT_HOST.config
  when: manual

snapshot:test:
  extends: .snapshot
  environment: test
  variables:
    RABBIT_HOST: test-rabbitmqserver

deploy:test:
  extends: .deploy
  environment: test
  variables:
    RABBIT_HOST: test-rabbitmqserver

rollback:test:
  extends: .rollback
  environment: test
  variables:
    RABBIT_HOST: test-rabbitmqserver

snapshot:production:
  extends: .snapshot
  environment: production
  variables:
    RABBIT_HOST: production-rabbitmqserver

deploy:production:
  extends: .deploy
  environment: production
  variables:
    RABBIT_HOST: production-rabbitmqserver

rollback:production:
  extends: .rollback
  environment: production
  variables:
    RABBIT_HOST: production-rabbitmqserver
```
