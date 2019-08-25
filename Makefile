##
# Makefile for local development
##

build: Dockerfile
	@docker build -t vtchrispeterson/rabbitmqadmin:local .

help:
	@docker run --rm \
		--name rabbitmqadmin-help \
		vtchrispeterson/rabbitmqadmin:local \
		--help

interactive:
	@docker run --rm -it --entrypoint bin/sh \
		--name rabbitmqadmin-interactive \
		vtchrispeterson/rabbitmqadmin:local
