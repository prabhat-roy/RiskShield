.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/settlement-service .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t riskshield/settlement-service:latest .

docker-run:
	docker run --rm -p 50083:50083 --env-file .env riskshield/settlement-service:latest
