FROM golang:1.19-alpine AS builder
COPY . /build
WORKDIR /build

RUN go mod download && \
    GO111MODULE=on GOOS=linux go build -v -o /client . && \
    ls -ltr /client

FROM alpine:3.17
COPY --from=builder /client /usr/bin/client

RUN chmod a+x /usr/bin/client

RUN adduser -D client
USER client

ENTRYPOINT [ "/usr/bin/client" ]
