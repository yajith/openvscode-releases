# Note: these can be overriden on the command line e.g. `make VERSION=2024.08`
VERSION=1.92.1

.PHONY: setup clean base

setup:
	docker run --rm --privileged multiarch/qemu-user-static --reset -p yes
	docker buildx create --name multiarch --driver docker-container --use
	docker buildx inspect --bootstrap

clean:
	docker buildx rm multiarch

base: setup
	docker buildx build --push --build-arg RELEASE_TAG=openvscode-server-v$(VERSION) --platform=linux/arm64,linux/amd64 -t yajithd/openvscode-server:$(VERSION) -f Dockerfile .
