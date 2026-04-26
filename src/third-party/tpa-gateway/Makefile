.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/tpa-gateway .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t riskshield/tpa-gateway:latest .

docker-run:
	docker run --rm -p 50263:50263 --env-file .env riskshield/tpa-gateway:latest
