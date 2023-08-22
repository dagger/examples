# DEPRECATION NOTICE

This repository is deprecated and will be removed on 1 Dec 2023. Dagger SDK examples in this repository have been migrated to the [primary Dagger repository](https://github.com/dagger/dagger) and work will continue in the new locations below:

- [Go SDK examples](https://github.com/dagger/dagger/tree/main/sdk/go/examples)
- [Node.js SDK examples](https://github.com/dagger/dagger/tree/main/sdk/nodejs/examples)
- [Python SDK examples](https://github.com/dagger/dagger/tree/main/sdk/python/examples)

# Dagger Examples

## Core Concepts

### Mounting source files to a container

- [Go](https://github.com/dagger/dagger/blob/main/sdk/go/examples/db-service/main.go#L37)
- [NodeJS](https://github.com/dagger/dagger/blob/main/sdk/nodejs/examples/db-service/build.js#L19)
- [Python](https://github.com/dagger/dagger/blob/main/sdk/python/examples/db-service/pipeline.py#L28)

### Multi-stage build

- [Go](https://github.com/dagger/dagger/blob/main/sdk/go/examples/multistage/main.go#L31)
- [NodeJS](https://github.com/dagger/dagger/blob/main/sdk/nodejs/examples/multistage/build.js#L14)
- [Python](https://github.com/dagger/dagger/blob/main/sdk/python/examples/multistage/pipeline.py#L19)

### Multi-platform build

- [Go](https://github.com/dagger/dagger/blob/main/sdk/go/examples/multiplatform/main.go#L30)
- [NodeJS](https://github.com/dagger/dagger/blob/main/sdk/nodejs/examples/multiplatform/build.js#L16)
- [Python](https://github.com/dagger/dagger/blob/main/sdk/python/examples/multiplatform/pipeline.py#L19)

### Cache mounts

- [Go](https://github.com/dagger/dagger/blob/main/sdk/go/examples/multiplatform/main.go#L34)
- [NodeJS](https://github.com/dagger/dagger/blob/main/sdk/nodejs/examples/multiplatform/build.js#L20)
- [Python](https://github.com/dagger/dagger/blob/main/sdk/python/examples/multiplatform/pipeline.py#L23)

### Concurrency

Note: While the DAG is constructed serially, the engine will execute the full DAG when the build artifacts directory is exported. Since each platform's build doesn't depend on the others, the engine will execute each build concurrently.

- [Go](https://github.com/dagger/dagger/blob/main/sdk/go/examples/multiplatform/main.go#L29)
- [NodeJS](https://github.com/dagger/dagger/blob/main/sdk/nodejs/examples/multiplatform/build.js#L15)
- [Python](https://github.com/dagger/dagger/blob/main/sdk/python/examples/multiplatform/pipeline.py#L17)

### Container publishing

- [Go](https://github.com/dagger/dagger/blob/main/sdk/go/examples/multistage/main.go#L41)
- [NodeJS](https://github.com/dagger/dagger/blob/main/sdk/nodejs/examples/multistage/build.js#L23)
- [Python](https://github.com/dagger/dagger/blob/main/sdk/python/examples/multistage/pipeline.py#L30)

### Secrets

- [Go](https://github.com/dagger/dagger/blob/main/sdk/go/examples/secrets/main.go#L21)
- [NodeJS](https://github.com/dagger/dagger/blob/main/sdk/nodejs/examples/secrets/ci.js#L6)
- [Python](https://github.com/dagger/dagger/blob/main/sdk/python/examples/secrets/pipeline.py#L9)

### Services

- [Go](https://github.com/dagger/dagger/blob/main/sdk/go/examples/db-service/main.go#L22)
- [NodeJS](https://github.com/dagger/dagger/blob/main/sdk/nodejs/examples/db-service/build.js#L6)
- [Python](https://github.com/dagger/dagger/blob/main/sdk/python/examples/db-service/pipeline.py#L10)

## By Language

### Go

- [multiarch build](https://github.com/dagger/dagger/tree/main/sdk/go/examples/multiarch-build/)
- [npm build](https://github.com/dagger/dagger/tree/main/sdk/go/examples/npm-build/)
- [yarn build](https://github.com/dagger/dagger/tree/main/sdk/go/examples/yarn-build/)
- [gradle build](https://github.com/dagger/dagger/tree/main/sdk/go/examples/gradle-build/)
- [services](https://github.com/dagger/dagger/tree/main/sdk/go/examples/db-service/)
- [secrets](https://github.com/dagger/dagger/tree/main/sdk/go/examples/secrets/)
- [multiplatform](https://github.com/dagger/dagger/tree/main/sdk/go/examples/multiplatform/)
- [multistage](https://github.com/dagger/dagger/tree/main/sdk/go/examples/multistage/)
- [replace dockerfile](https://github.com/dagger/dagger/tree/main/sdk/go/examples/replace-dockerfile/)
- [aws cdk](https://github.com/dagger/dagger/tree/main/sdk/go/examples/aws-cdk/)

### Python

- [basic example](https://github.com/dagger/dagger/tree/main/sdk/python/examples/basic-example/)
- [services](https://github.com/dagger/dagger/tree/main/sdk/python/examples/db-service/)
- [secrets](https://github.com/dagger/dagger/tree/main/sdk/python/examples/secrets/)
- [multiplatform](https://github.com/dagger/dagger/tree/main/sdk/python/examples/multiplatform/)
- [multistage](https://github.com/dagger/dagger/tree/main/sdk/python/examples/multistage/)

### Node.js (Typescript/Javascript)

- [react build](https://github.com/dagger/dagger/tree/main/sdk/nodejs/examples/react-build/)
- [services](https://github.com/dagger/dagger/tree/main/sdk/nodejs/examples/db-service/)
- [secrets](https://github.com/dagger/dagger/tree/main/sdk/nodejs/examples/secrets/)
- [multiplatform](https://github.com/dagger/dagger/tree/main/sdk/nodejs/examples/multiplatform/)
- [multistage](https://github.com/dagger/dagger/tree/main/sdk/nodejs/examples/multistage/)
- [Pulumi](https://github.com/dagger/dagger/tree/main/sdk/nodejs/examples/pulumi/)

### Bash with Dagger CLI and GraphQL

- [git build](https://github.com/dagger/dagger/tree/main/cmd/examples/git-build/)

### GraphQL queries

- TODO. [API Reference here](https://docs.dagger.io/api)
