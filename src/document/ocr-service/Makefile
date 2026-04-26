.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/ocr-service .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t riskshield/ocr-service:latest .

docker-run:
	docker run --rm -p 50321:50321 --env-file .env riskshield/ocr-service:latest
