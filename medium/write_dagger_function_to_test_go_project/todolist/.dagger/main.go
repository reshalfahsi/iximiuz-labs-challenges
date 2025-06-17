// A generated module for Todolist functions
//
// This module has been generated via dagger init and serves as a reference to
// basic module structure as you get started with Dagger.
//
// Two functions have been pre-created. You can modify, delete, or add to them,
// as needed. They demonstrate usage of arguments and return types using simple
// echo and grep commands. The functions can be called from the dagger CLI or
// from one of the SDKs.
//
// The first line in this comment block is a short description line and the
// rest is a long description with more detail on the module's purpose or usage,
// if appropriate. All modules should have a short description.

package main

// import (
// 	"context"
// 	"dagger/todolist/internal/dagger"
// )

// type Todolist struct{}

// // Returns a container that echoes whatever string argument is provided
// func (m *Todolist) ContainerEcho(stringArg string) *dagger.Container {
// 	return dag.Container().From("alpine:latest").WithExec([]string{"echo", stringArg})
// }

// // Returns lines that match a pattern in the files of the provided Directory
// func (m *Todolist) GrepDir(ctx context.Context, directoryArg *dagger.Directory, pattern string) (string, error) {
// 	return dag.Container().
// 		From("alpine:latest").
// 		WithMountedDirectory("/mnt", directoryArg).
// 		WithWorkdir("/mnt").
// 		WithExec([]string{"grep", "-R", pattern, "."}).
// 		Stdout(ctx)
// }

// package dagger

import (
	"dagger/todolist/internal/dagger"
)

type Todolist struct{}

func (m *Todolist) Test(
	src *dagger.Directory,
	// +optional
	run string,
	// +optional
	count string,
) *dagger.Container {
	args := []string{"go", "test", "./...", "-v"}
	if run != "" {
		args = append(args, "-run", run)
	}
	if count != "" {
		args = append(args, "-count", count)
	}
	return dag.Container().
		From("golang:1.22.2").
		WithDirectory("/src", src).
		WithWorkdir("/src").
		WithExec(args)
}