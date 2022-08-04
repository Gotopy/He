FROM golang:1.16-alpine3.12 as builder

ENV GOPATH /go

ENV GOCACHE /go/caches/go-build

RUN apk add --no-cache git alpine-sdk

ADD . /go/src/hello
WORKDIR /go/src/hello

# build the source
#RUN make init
RUN make build

# use a minimal alpine image
FROM alpine:3.12

# add ca-certificates in case you need them
RUN apk update && apk add ca-certificates && rm -rf /var/cache/apk/*

# set working directory
WORKDIR /go/bin

COPY --from=builder /go/src/hello/main ./hello

USER 1001
# run the binary
CMD ["./hello"]