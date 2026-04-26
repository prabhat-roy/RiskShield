.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/form-service .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t riskshield/form-service:latest .

docker-run:
	docker run --rm -p 50204:50204 --env-file .env riskshield/form-service:latest
