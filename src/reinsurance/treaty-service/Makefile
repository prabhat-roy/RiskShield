.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/treaty-service .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t riskshield/treaty-service:latest .

docker-run:
	docker run --rm -p 50100:50100 --env-file .env riskshield/treaty-service:latest
