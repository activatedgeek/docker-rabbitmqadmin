##
# Makefile for development environments
##

latest: Dockerfile
	@docker build -t vtchrispeterson/rabbitmqadmin:devel .

run:
	@docker run --rm \
		--name test-rabbitmqadmin \
		vtchrispeterson/rabbitmqadmin:devel \
		--version
