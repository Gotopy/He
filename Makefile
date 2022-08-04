.PHONY: build
build:
	CGO_ENABLED=0 GOSUMDB=off go build ./main.go
