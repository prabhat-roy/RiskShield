.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/cohort-analytics .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t riskshield/cohort-analytics:latest .

docker-run:
	docker run --rm -p 50302:50302 --env-file .env riskshield/cohort-analytics:latest
