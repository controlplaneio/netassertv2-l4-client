build:
	@go build -o bin/client main.go

build-race:
	@go build -race -o bin/client main.go

lint:
	golangci-lint run ./...
clean:
	@rm -rf bin/client

docker-build:
	docker build -f Dockerfile \
	--no-cache \
    --tag local/client:0.0.1 .
