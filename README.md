# protos

A small Docker image containing the necessary binaries to generate gRPC services
in Go and lint proto files.

## Usage

The following are ways of using the Docker image. All usages assume the project
source is mounted to `/opt/protos/src` and proto files exist under a `proto`
directory.

### From Source

```
git clone https://github.com/dane/protos.git
cd protos
make build
docker -v /my/project:/opt/protos/src -ti protos generate
```
