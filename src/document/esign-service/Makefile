.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/esign-service .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t riskshield/esign-service:latest .

docker-run:
	docker run --rm -p 50323:50323 --env-file .env riskshield/esign-service:latest
