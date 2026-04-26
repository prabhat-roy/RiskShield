.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/customer-service .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t riskshield/customer-service:latest .

docker-run:
	docker run --rm -p 50180:50180 --env-file .env riskshield/customer-service:latest
