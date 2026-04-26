.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/ifrs17-service .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t riskshield/ifrs17-service:latest .

docker-run:
	docker run --rm -p 50123:50123 --env-file .env riskshield/ifrs17-service:latest
