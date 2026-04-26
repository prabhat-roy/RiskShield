.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/tenant-service .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t riskshield/tenant-service:latest .

docker-run:
	docker run --rm -p 51006:51006 --env-file .env riskshield/tenant-service:latest
