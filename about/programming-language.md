# Programming Language

- [Golang](#golang)
  - [Tooling](#tooling)
  - [Cross Compilation](#cross-compilation)

## Golang

### Tooling

- Running Code `go run`
- Documentation `godoc`
- Environment Information `go env`
- Dependency Manager `go get` or `go install`
- Code Formatting `gofmt`
- Code Linting `go vet`
- Build System `go build`
- Cross-Compilation
- Unit Test `go test`
- Code Coverage `go test -coverprofile=coverage.out -covermode=atomic`
- Stress Test `stress`
- Benchmarks `go test -bench=.`
- Profiling `go tool pprof`
- Tracing `go tool trace`
- Race Conditions `go test -race`
- Release Update `go fix`

### Cross Compilation

By default, go build outputs a binary that is suitable for use on your current operating system and architecture. However, it also supports cross-compilation, so you can generate a binary that is suitable for use on another machine.

For example:

```bash
GOOS=linux GOARCH=amd64 go build -o=/tmp/linux_amd64/foo .
GOOS=windows GOARCH=amd64 go build -o=/tmp/windows_amd64/foo.exe .
```

- List of supported OS/architecture combinations:

  ```bash
  go tool dist list
  ```

- List of available compiler flags:

  ```bash
  go tool compile -help
  ```

- List of available linker flags:

  ```bash
  go tool link -help
  ```
