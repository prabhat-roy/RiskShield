.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/scoring-service .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t riskshield/scoring-service:latest .

docker-run:
	docker run --rm -p 50143:50143 --env-file .env riskshield/scoring-service:latest
