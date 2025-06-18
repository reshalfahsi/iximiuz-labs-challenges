# **Write a Dagger Function to Test a Go Project**

In the previous challenge, you learned how to [create a Dagger module](https://labs.iximiuz.com/challenges/create-first-dagger-module) with a few dummy Dagger Functions in it. Now you will need to create a more useful module - one that can **run the unit tests of a Go project**.

The sample Go project is located in ``~/todolist``. Explore it, paying special attention to the Makefile. After that, in the project's root directory, bootstrap a Dagger module. The module should have only one Dagger Function, which performs the ``go test`` command. The function should take in the project's root directory and two **optional arguments**:

- The filter expression to run only the matching tests (default: an empty string, meaning all tests).
- The number of times to run the test suite (default: an empty string, meaning the ``-count`` flag of the ``go test`` command is not set).

The solution checker will use the following commands to verify the implementation:

```bash
# Assuming the PWD is the project's root directory

dagger call test --src . stdout
dagger call test --src . --run NoSuchTest stdout
dagger call test --src . --run CreateTodo --count 10 stdout
```

Make sure the ``test`` function runs only the unit tests of the project because the e2e suite would require spinning up the dependencies (e.g. a database).

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
  // Your implementation goes here...
}
```
>
> The above is Go code, but you're free to use any of the supported languages.


> **Hint #3:**
>
> Even though Dagger Functions are written in full-blown programming languages, they often look like a bunch of shell commands glued together with Go (or Python, or TypeScript, or whatever). Something still has to execute that ``go test`` command.

> **Hint #4:**
>
> Tried executing the ``go test`` command directly from the ``test`` function and it failed? To be able to run the ``go test`` command, you need a proper Go development environment, and the function's runtime is definitely not suitable for that.
>
> Dagger uses additional containers to provision required environments for every command execution. Here is what you can do:
>
```go
func (m *Todolist) Test(
  src *dagger.Directory,
  // +optional
  run string,
  // +optional
  count string,
) *dagger.Container {
  return dag.Container().
    From("golang:1").
      WithDirectory("/src", src).
      WithExec([]string{"go", "test", "..."})
    ...
}
```

## **Source**

[Write a Dagger Function to Test a Go Project](https://labs.iximiuz.com/challenges/write-dagger-function-to-test-go-project)

## **[Back to Home](../../)**