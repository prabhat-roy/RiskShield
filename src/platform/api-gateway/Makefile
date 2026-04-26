.PHONY: build test run lint tidy docker-build docker-run

build:
	go build -o bin/api-gateway .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t riskshield/api-gateway:latest .

docker-run:
	docker run --rm -p 50000:50000 --env-file .env riskshield/api-gateway:latest
