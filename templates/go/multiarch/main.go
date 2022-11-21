package main

import (
	"context"
	"fmt"
	"os"
	"path/filepath"

	"dagger.io/dagger"
)

func main() {
	repo := "https://github.com/kpenfound/greetings-api.git" // Default repo to build
	if len(os.Args) > 1 {                                    // Optionally pass in a git repo as a command line argument
		repo = os.Args[1]
	}
	if err := build(repo); err != nil {
		fmt.Println(err)
	}
	filepath.Walk("build", func(name string, info os.FileInfo, err error) error {
		if !info.IsDir() {
			fmt.Println(name)
		}
		return nil
	})
}

func build(repoUrl string) error {
	ctx := context.Background()

	// Our build matrix
	oses := []string{"linux", "darwin"}
	arches := []string{"amd64", "arm64"}
	goVersions := []string{"1.18", "1.19"}

	// create a Dagger client
	client, err := dagger.Connect(ctx, dagger.WithLogOutput(os.Stdout))
	if err != nil {
		return err
	}
	defer client.Close()

	// clone the specified git repo
	repo := client.Git(repoUrl)
	src := repo.Branch("main").Tree()

	outdir := client.Directory()

	for _, version := range goVersions {
		// Get golang image and mount go source
		imageTag := fmt.Sprintf("golang:%s", version)
		golang := client.Container().From(imageTag)
		golang = golang.WithMountedDirectory("/src", src).WithWorkdir("/src")

		// Run matrix builds in parallel
		for _, goos := range oses {
			for _, goarch := range arches {
				path := fmt.Sprintf("build/%s/%s/%s/", version, goos, goarch)

				// Set GOARCH and GOOS and build
				build := golang.WithEnvVariable("GOOS", goos)
				build = build.WithEnvVariable("GOARCH", goarch)
				build = build.Exec(dagger.ContainerExecOpts{
					Args: []string{"go", "build", "-o", path},
				})
				outdir = outdir.WithDirectory(path, build.Directory(path))
			}
		}
	}
	_, err = outdir.Export(ctx, ".")
	return err
}
