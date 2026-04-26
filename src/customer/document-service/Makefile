.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/document-service .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t riskshield/document-service:latest .

docker-run:
	docker run --rm -p 50183:50183 --env-file .env riskshield/document-service:latest
