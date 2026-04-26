.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/appetite-service .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t riskshield/appetite-service:latest .

docker-run:
	docker run --rm -p 50063:50063 --env-file .env riskshield/appetite-service:latest
