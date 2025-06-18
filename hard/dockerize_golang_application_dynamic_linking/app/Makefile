.PHONY: build
build:
        CGO_ENABLED=1 go build -o server main.go

.PHONY: run
run: build
        ./server

.PHONY: docker-build
docker-build:
        docker build -t registry.iximiuz.com/app:v1.0.0 .

.PHONY: docker-run
docker-run: docker-build
        docker run -p 3000:3000 registry.iximiuz.com/app:v1.0.0