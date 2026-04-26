.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/litigation-service .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t riskshield/litigation-service:latest .

docker-run:
	docker run --rm -p 50084:50084 --env-file .env riskshield/litigation-service:latest
