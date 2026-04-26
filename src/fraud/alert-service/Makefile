.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/alert-service .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t riskshield/alert-service:latest .

docker-run:
	docker run --rm -p 50144:50144 --env-file .env riskshield/alert-service:latest
