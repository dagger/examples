Mix.install([
  {:dagger, github: "wingyplus/dagger", sparse: "sdk/elixir", ref: "iss-5333"},
  :uuid
])

client = Dagger.connect!()

project =
  client
  |> Dagger.Client.git("https://github.com/dagger/dagger")
  |> Dagger.GitRepository.branch("main")
  |> Dagger.GitRef.tree()

build =
  client
  |> Dagger.Client.container()
  |> Dagger.Container.from("golang:1.20")
  |> Dagger.Container.with_directory("/src", project)
  |> Dagger.Container.with_workdir("/src")
  |> Dagger.Container.with_exec(["go", "build", "./cmd/dagger"])

client
|> Dagger.Client.container()
|> Dagger.Container.from("cgr.dev/chainguard/wolfi-base:latest")
|> Dagger.Container.with_default_args()
|> Dagger.Container.with_file("/bin/dagger", Dagger.Container.file(build, "/src/dagger"))
|> Dagger.Container.with_entrypoint(["/bin/dagger"])
|> Dagger.Container.publish("ttl.sh/dagger-#{UUID.uuid4()}:1h")

Dagger.close(client)
