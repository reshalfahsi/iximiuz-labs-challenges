# **Write a Dagger Function to Build a Go Project**

In the previous challenge, you learned how to [create a Dagger module](https://labs.iximiuz.com/challenges/create-first-dagger-module) with a few dummy Dagger Functions in it. Now you will need to create a more useful module - one that can **build a multi-arch Go project**.

The sample Go project is located in ``~/my-project``. Explore it, paying special attention to the Makefile. After that, <ins>in the project's root directory</ins>, bootstrap a Dagger module. The module should have only one Dagger Function, which performs the same ``go build`` command that the Makefile uses. The function should take in the project's root directory and the target architecture, execute the ``go build`` command, and return the resulting binary file.

The solution checker will use the following commands to verify the implementation:

```bash
# Assuming the PWD is the project's root directory

dagger call build --src . --arch arm64 export --path ./server
dagger call build --src . --arch amd64 export --path ./server
```

Good luck!

> **Hint #1:**
>
> Don't know where to start? Check out [this post on writing Dagger Functions](https://labs.iximiuz.com/courses/dagger/writing-first-function).

> **Hint #2:**
>
> The function should conform to the following signature:
>
```go
import (
  "dagger/my-project/internal/dagger"
)

type MyProject struct{}

func (m *MyProject) Build(
  src *dagger.Directory,
  arch string,
) *dagger.File {
  // Your implementation goes here...
}
```
>
> The above is Go code, but you're free to use any of the supported languages.


> **Hint #3:**
>
> Even though Dagger Functions are written in full-blown programming languages, they often look like a bunch of shell commands glued together with Go (or Python, or TypeScript, or whatever). Something still has to execute that ``go build`` command.

> **Hint #4:**
>
> Tried executing the ``go build`` command directly from the ``build`` function and it failed? To be able to run the ``go build`` command, you need a proper Go development environment, and the function's runtime is definitely not suitable for that.
>
> Dagger uses additional containers to provision required environments for every command execution. Here is what you can do:
>
```go
func (m *MyProject) Build(
  src *dagger.Directory,
  arch string,
) *dagger.File {
  buildContainer := dag.Container().
    From("golang:1").
      WithDirectory("/src", src).
      WithExec([]string{"go", "build", "..."})
    ...
}
```

## **Source**

[Write a Dagger Function to Build a Go Project](https://labs.iximiuz.com/challenges/write-first-dagger-function)

## **[Back to Home](../../)**