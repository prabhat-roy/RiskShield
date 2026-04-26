.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/telematics-service .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t riskshield/telematics-service:latest .

docker-run:
	docker run --rm -p 50280:50280 --env-file .env riskshield/telematics-service:latest
