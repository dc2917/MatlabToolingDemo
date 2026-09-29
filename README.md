# MatlabToolingDemo

A repository to demonstrate software engineering tools for MATLAB/Octave.

## The Tools

- Formatter: [mh_style][mh_style]
- Linter: [mh_lint][mh_lint]
- Pre-commit hooks: [pre-commit][pre-commit]
- Test framework: [matlab.unittest][matlab-unittest]
- Code coverage analyser: [matlab.unittest.plugins.CodeCoveragePlugin][coverage-plugin]

## Installation

1. Clone the repository

   ```sh
   git clone https://github.com/dc2917/MatlabToolingDemo.git
   ```

1. Install the python tools

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

```sh
mh_style .
```

Linting/static analysis

```sh
mh_lint .
```

Pre-commit hooks

```sh
pre-commit run --all-files
```

Testing

```sh
matlab -batch "run tests/runTests.m"
```

[mh_style]: https://florianschanda.github.io/miss_hit/style_checker.html
[mh_lint]: https://florianschanda.github.io/miss_hit/lint.html
[pre-commit]: https://pre-commit.com/
[matlab-unittest]: https://uk.mathworks.com/help/matlab/matlab-unit-test-framework.html
[coverage-plugin]: https://uk.mathworks.com/help/matlab/ref/matlab.unittest.plugins.codecoverageplugin-class.html
