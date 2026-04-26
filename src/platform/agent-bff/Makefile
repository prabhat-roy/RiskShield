.PHONY: build test run lint tidy docker-build docker-run

build:
	go build -o bin/agent-bff .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t riskshield/agent-bff:latest .

docker-run:
	docker run --rm -p 50002:50002 --env-file .env riskshield/agent-bff:latest
