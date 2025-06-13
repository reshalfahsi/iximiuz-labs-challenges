import dagger
from dagger import dag, function, object_type


@object_type
class MyProject:
    # lint is a placeholder for the lint task.
    @function
    def lint(self) -> str:
        """
        A placeholder for the lint task.
        """
        return "Lint task completed."

    # test is a placeholder for the test task.
    @function
    def test(self) -> str:
        """
        A placeholder for the test task.
        """
        return "Test task completed."

    # build is a placeholder for the build task.
    @function
    def build(self) -> str:
        """
        A placeholder for the build task.
        """
        return "Build task completed."
