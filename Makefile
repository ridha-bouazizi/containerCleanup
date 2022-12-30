all: build

help:
	@echo ""
	@echo "-- Help Menu"
	@echo ""
	@echo "   1. make              - build the image"
	@echo "   2. make run          - run r08041994b/containerCleanup"
	@echo "   3. make rm           - destroy r08041994b/containerCleanup container"
	@echo "   4. make rebuild      - rebuild r08041994b/containerCleanup container"
	@echo "   5. make restart      - restart r08041994b/containerCleanup container"
	@echo "   6. make int          - enter the r08041994b/containerCleanup container on with a bash prompt"

default: build

build:
	docker build --rm -t r08041994b/containerCleanup:latest .

run:
	docker run --env-file ./env.list --name r08041994b/containerCleanup -v /var/run/docker.sock:/var/run/docker.sock:rw -v /var/lib/docker:/var/lib/docker:rw -d r08041994b/containerCleanup

int:
	docker exec -it r08041994b/containerCleanup bash

rm:
	docker stop r08041994b/containerCleanup
	docker rm -f r08041994b/containerCleanup

rebuild: rm build run

restart: rm run
