.PHONY: build test run lint tidy docker-build docker-run

build:
	go build -o bin/graphql-gateway .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t riskshield/graphql-gateway:latest .

docker-run:
	docker run --rm -p 50004:50004 --env-file .env riskshield/graphql-gateway:latest
