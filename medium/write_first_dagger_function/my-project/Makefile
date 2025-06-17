GOARCH ?= amd64

.PHONY: build
build:
        CGO_ENABLED=0 go build -o ./server .

.PHONY: run
run:
        ./server