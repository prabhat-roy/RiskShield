.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/solvency-reporting .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t riskshield/solvency-reporting:latest .

docker-run:
	docker run --rm -p 50240:50240 --env-file .env riskshield/solvency-reporting:latest
