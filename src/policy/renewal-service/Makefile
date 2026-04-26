.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/renewal-service .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t riskshield/renewal-service:latest .

docker-run:
	docker run --rm -p 50042:50042 --env-file .env riskshield/renewal-service:latest
