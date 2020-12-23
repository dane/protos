# protos

A small Docker image containing the necessary binaries to generate gRPC services
in Go and lint proto files. As underlying binaries change the interfaces will
not, `generate` and `lint` will remain the same commands.

## Usage

The following are ways of using the Docker image. All usages assume:
- The project source is mounted to `/opt/protos/src`
- Proto files exist under a `proto` directory
- Generated files will be written to `proto/gen/go`

### From Docker

```
docker run \
  -v `pwd`:/opt/protos/src \
  -ti ghcr.io/dane/protos:v0.0.1 generate
```

### From Source

```
git clone https://github.com/dane/protos.git
cd protos
make build
docker -v /my/project:/opt/protos/src -ti protos generate
```
