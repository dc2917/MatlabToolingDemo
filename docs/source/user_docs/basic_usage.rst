Basic Usage
===========

Formatting source code with ``mh_style``
----------------------------------------

Within a terminal::

  mh_style .


Linting/static analysis with ``codeIssues``
-------------------------------------------

Within a terminal::

  matlab -batch "buildtool check"

From the MATLAB command line::

  buildtool check

Running the pre-commit hooks with ``pre-commit``
------------------------------------------------

Within a terminal::

  pre-commit run --all-files

Running test suites
-------------------

Within a terminal::

  matlab -batch "buildtool test-unit test-regression"

From the MATLAB command line::

  buildtool test-unit test-regression
