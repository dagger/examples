# Dagger Examples

If you'd like to see a new example, please open an issue.

## Core Concepts

### Mounting source files to a container

- [Go](./go/db-service/main.go#L37)
- [NodeJS](./nodejs/db-service/build.js#L19)
- [Python](./python/db-service/pipeline.py#L28)

### Multi-stage build

- [Go](./go/multistage/main.go#L31)
- [NodeJS](./nodejs/multistage/build.js#L14)
- [Python](./python/multistage/pipeline.py#L19)

### Multi-platform build

- [Go]() TODO
- [NodeJS]() TODO
- [Python]() TODO

### Cache mounts

- [Go]() TODO - demo this in multi-plat example
- [NodeJS]() TODO
- [Python]() TODO

### Concurrency

- [Go](./go/multiarch-build/main.go#43)
- [NodeJS]() TODO
- [Python]() TODO

### Container publishing

- [Go](./go/multistage/main.go#L41)
- [NodeJS](./nodejs/multistage/build.js#23)
- [Python](./python/multistage/pipeline.py#L30)

### Secrets

- [Go]() TODO
- [NodeJS]() TODO
- [Python]() TODO

### Services

- [Go](./go/db-service/main.go#L22)
- [NodeJS](./nodejs/db-service/build.js#L6)
- [Python](./python/db-service/pipeline.py#L10)

### Testing your pipelines

- [Go]() TODO
- [NodeJS]() TODO
- [Python]() TODO

## By Language

### Go

- [multiarch build](./go/multiarch-build/)
- [npm build](./go/npm-build/)
- [yarn build](./go/yarn-build/)
- [gradle build](./go/gradle-build/)
- [services](./go/db-service/)
- [replace dockerfile](./go/replace-dockerfile/)
- [aws cdk](./go/aws-cdk/)

### Python

- [basic example](./python/basic-example/)
- [services](./python/db-service/)

### Node.js (Typescript/Javascript)

- [react build](./nodejs/react-build/)
- [services](./nodejs/db-service/)

### Bash with Dagger CLI and GraphQL

- [git build](./bash/git-build/)

### GraphQL queries

- TODO. [API Reference here](https://docs.dagger.io/api)
