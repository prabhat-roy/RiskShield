.PHONY: build test run lint tidy docker-build docker-run

build:
	go build -o bin/claims-bff .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t riskshield/claims-bff:latest .

docker-run:
	docker run --rm -p 50003:50003 --env-file .env riskshield/claims-bff:latest
