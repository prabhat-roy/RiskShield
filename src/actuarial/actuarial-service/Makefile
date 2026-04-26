.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/actuarial-service .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t riskshield/actuarial-service:latest .

docker-run:
	docker run --rm -p 50120:50120 --env-file .env riskshield/actuarial-service:latest
