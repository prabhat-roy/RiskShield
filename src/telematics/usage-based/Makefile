.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/usage-based .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t riskshield/usage-based:latest .

docker-run:
	docker run --rm -p 50282:50282 --env-file .env riskshield/usage-based:latest
