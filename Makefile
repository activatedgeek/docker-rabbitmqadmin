##
# Makefile for local development
##

build: Dockerfile
	@docker build -t vtchrispeterson/rabbitmqadmin:local .

help:
	@docker run --rm \
		--name test-rabbitmqadmin \
		vtchrispeterson/rabbitmqadmin:local \
		--help
