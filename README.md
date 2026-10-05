# MatlabToolingDemo

A repository to demonstrate software engineering tools for MATLAB.

Many programming languages have collections of development tools for dependency
management, packaging, code formatting, linting, testing and so on. These tools
are essential for the successful collaborative development of software: they
make developers' lives easier, removing the need to manually perform mundane or
laborious tasks, and make collaboration smoother with all developers using the
same toolkits and following consistent conventions.

Unfortunately, the use of such tooling is largely absent from MATLAB projects,
perhaps in part because of how MATLAB is used in practice compared to other
programming languages, but this need not be the case. The aim of this repository
is, therefore, to demonstrate how such tools can be used in a MATLAB project.

## The Tools

- Formatter: [mh_style][mh_style]
- Linter: [matlab.codeIssues][matlab-codeIssues]
- Pre-commit hooks: [pre-commit][pre-commit]
- Test framework: [matlab.unittest][matlab-unittest]
- Code coverage analyser:
  [matlab.unittest.plugins.CodeCoveragePlugin][coverage-plugin]
- API documentation builder:
  [Sphinx][sphinx] with [matlabdomain][matlabdomain]

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
  matlab -batch "buildtool check"
  ```

- From the MATLAB command line:

  ```matlab
  buildtool check
  ```

Pre-commit hooks

- Within a terminal:

  ```sh
  pre-commit run --all-files
  ```

Testing

- Within a terminal:

  ```sh
  matlab -batch "buildtool test-unit test-regression"
  ```

- From the MATLAB command line:

  ```matlab
  buildtool test-unit test-regression
  ```

[mh_style]: https://florianschanda.github.io/miss_hit/style_checker.html
[matlab-codeIssues]: https://uk.mathworks.com/help/matlab/ref/codeissues.html
[pre-commit]: https://pre-commit.com/
[matlab-unittest]: https://uk.mathworks.com/help/matlab/matlab-unit-test-framework.html
[coverage-plugin]: https://uk.mathworks.com/help/matlab/ref/matlab.unittest.plugins.codecoverageplugin-class.html
[sphinx]: https://www.sphinx-doc.org
[matlabdomain]: https://sphinxcontrib-matlabdomain.readthedocs.io/
