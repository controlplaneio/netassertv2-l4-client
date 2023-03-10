FROM golang:1.19-alpine AS builder
COPY . /build
WORKDIR /build

RUN go mod download && \
    CGO_ENABLED=0 GO111MODULE=on GOOS=linux go build -v -o /netassertv2-l4-client . && \
    ls -ltr /netassertv2-l4-client

FROM alpine:3.17
COPY --from=builder /netassertv2-l4-client /usr/bin/netassertv2-l4-client

RUN chmod a+x /usr/bin/netassertv2-l4-client

RUN adduser -D netassertv2-l4-client
USER netassertv2-l4-client

ENTRYPOINT [ "/usr/bin/netassertv2-l4-client" ]
