.PHONY: build test run lint tidy docker-build docker-run

build:
	go build -o bin/customer-bff .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t riskshield/customer-bff:latest .

docker-run:
	docker run --rm -p 50001:50001 --env-file .env riskshield/customer-bff:latest
