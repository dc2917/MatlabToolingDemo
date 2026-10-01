# MatlabToolingDemo

A repository to demonstrate software engineering tools for MATLAB.

## The Tools

- Formatter: [mh_style][mh_style]
- Linter: [matlab.codeIssues][matlab-codeIssues]
- Pre-commit hooks: [pre-commit][pre-commit]
- Test framework: [matlab.unittest][matlab-unittest]
- Code coverage analyser: [matlab.unittest.plugins.CodeCoveragePlugin][coverage-plugin]

## Installation

1. Clone the repository

   ```sh
   git clone https://github.com/dc2917/MatlabToolingDemo.git
   ```

1. Install the development dependencies

   ```sh
   python -m venv .venv
   .venv/bin/activate
   pip install -r dev-requirements.txt
   ```

1. Install the pre-commit hooks

   ```sh
   pre-commit install
   ```

## Usage

Formatting

- Within a terminal:

  ```sh
  mh_style .
  ```

Linting/static analysis

- Within a terminal:

  ```sh
  matlab -batch check_code
  ```

- Within the MATLAB IDE:

  ```matlab
  check_code
  ```

Pre-commit hooks

- Within a terminal:

  ```sh
  pre-commit run --all-files
  ```

Testing

- Within a terminal:

  ```sh
  matlab -batch "run tests/runTests"
  ```

- Within the MATLAB IDE:

  ```matlab
  run tests/runTests
  ```

[mh_style]: https://florianschanda.github.io/miss_hit/style_checker.html
[matlab-codeIssues]: https://uk.mathworks.com/help/matlab/ref/codeissues.html
[pre-commit]: https://pre-commit.com/
[matlab-unittest]: https://uk.mathworks.com/help/matlab/matlab-unit-test-framework.html
[coverage-plugin]: https://uk.mathworks.com/help/matlab/ref/matlab.unittest.plugins.codecoverageplugin-class.html
