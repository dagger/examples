package main

import (
	"dagger.io/dagger"
	"dagger.io/dagger/core"
	"universe.dagger.io/alpine"
	"universe.dagger.io/bash"
	"universe.dagger.io/docker"
)

dagger.#Plan & {
	//Write the output of the gradle build to the client dev machine
	client: {
		filesystem: {
			"./target": write: contents: actions.build.maven.export.directories."/target"
		}
	}

	actions: {
		build: {
			// core.#Source lets you access a file system tree (dagger.#FS)
			// using a path at "." or deeper (e.g. "./foo" or "./foo/bar") with
			// optional include/exclude of specific files/directories/globs
			checkoutCode: core.#Source & {
				path: "."
			}
			// Build an alpine image with gradle and bash installed
			base: alpine.#Build & {
				packages: {
					"maven": _
					"bash":   _
				}
			}
			// Pull image with OpenJDK from Docker Hub
			jdk: docker.#Pull & {
				source: "eclipse-temurin:8-alpine"
			}
			// User docker.#Run to export openjdk dir from jdk container	
			javaHome: docker.#Run & {
				input: jdk.output
				export: {
					directories: "/opt/java/openjdk": _
				}
			}
			// Copy the openjdk contents to the alpine gradle image
			copyJava: docker.#Copy & {
				input: base.output
				contents: javaHome.export.directories."/opt/java/openjdk"
				dest: "/usr/lib/openjdk"
			}
			// Finally copy the source code into the image
			image: docker.#Copy & {
				input:    copyJava.output
				contents: checkoutCode.output
			}
			// Runs a bash script in the input container
			// in this case `maven wrapper`, `mvnw...`
			// for more control over gradle version for build, etc.
			// Simple `mvn build` can be used instead, just invert commments #
			// export the /target directory to write to client machine
			maven: bash.#Run & {
				input: image.output
				script: contents: """
					#maven build
					mvn -N wrapper:wrapper -Dmaven=3.5.2
					./mvnw clean package
					/usr/lib/openjdk/bin/java -jar ./target/gs-maven-0.1.0.jar 
					"""
				export: directories: "/target": _
			}
		}
	}
}
