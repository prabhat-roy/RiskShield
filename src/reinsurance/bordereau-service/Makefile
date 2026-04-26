.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/bordereau-service .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t riskshield/bordereau-service:latest .

docker-run:
	docker run --rm -p 50103:50103 --env-file .env riskshield/bordereau-service:latest
