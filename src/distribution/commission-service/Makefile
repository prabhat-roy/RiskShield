.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/commission-service .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t riskshield/commission-service:latest .

docker-run:
	docker run --rm -p 50162:50162 --env-file .env riskshield/commission-service:latest
