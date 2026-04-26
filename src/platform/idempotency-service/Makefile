.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/idempotency-service .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t riskshield/idempotency-service:latest .

docker-run:
	docker run --rm -p 51000:51000 --env-file .env riskshield/idempotency-service:latest
