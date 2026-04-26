.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/exclusion-service .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t riskshield/exclusion-service:latest .

docker-run:
	docker run --rm -p 50202:50202 --env-file .env riskshield/exclusion-service:latest
