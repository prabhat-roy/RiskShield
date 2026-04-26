.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/channel-service .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t riskshield/channel-service:latest .

docker-run:
	docker run --rm -p 50164:50164 --env-file .env riskshield/channel-service:latest
