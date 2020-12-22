FROM golang:1.15.6-alpine AS build

WORKDIR /go/src/github.com/dane/proto

COPY files/tools.go .

RUN go mod init && go mod tidy
RUN go install \
    google.golang.org/protobuf/cmd/protoc-gen-go \
    google.golang.org/grpc/cmd/protoc-gen-go-grpc

FROM bufbuild/buf:0.33.0

LABEL org.opencontainers.image.source="https://github.com/dane/protos"
LABEL org.opencontainers.image.authors="Dane Harrigan"
LABEL org.opencontainers.image,licenses="Mozilla 2.0"

WORKDIR /opt/protos

ENV PATH=$PATH:/opt/protos/bin

ENTRYPOINT ["/opt/protos/bin/entrypoint"]

COPY files/buf.yaml /opt/protos/
COPY files/buf.gen.yaml /opt/protos/
COPY files/entrypoint /opt/protos/bin/entrypoint

COPY --from=build /go/bin/protoc-gen-go /usr/local/bin/protoc-gen-go
COPY --from=build /go/bin/protoc-gen-go-grpc /usr/local/bin/protoc-gen-go-grpc
