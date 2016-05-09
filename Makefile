##
# Makefile for development environments
##

latest: Dockerfile
	@docker build -t activatedgeek/rabbitmqadmin:devel .

run:
	@docker run --rm \
		--name test-rabbitmqadmin \
		activatedgeek/rabbitmqadmin:devel \
		--version
