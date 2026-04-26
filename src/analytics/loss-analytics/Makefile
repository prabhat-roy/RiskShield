.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/loss-analytics .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t riskshield/loss-analytics:latest .

docker-run:
	docker run --rm -p 50300:50300 --env-file .env riskshield/loss-analytics:latest
