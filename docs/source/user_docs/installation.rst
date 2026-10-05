Installation
============

In addition to MATLAB, the requirements for using MatlabToolingDemo are `Git`_ and
`Python`_.

Assuming you have these installed, first, clone the repository::

  $ git clone https://github.com/dc2917/MatlabToolingDemo

Create a virtual environment to keep the Python packages separate from system packages
and other local environments::

  $ cd MatlabToolingDemo
  $ python -m venv .venv

Activate the environment::

  $ source .venv/bin/activate

Install the dependencies::

  $ pip install -r dev-requirements.txt

.. _Git: https://git-scm.com/book/en/v2/Getting-Started-Installing-Git
.. _Python: https://www.python.org/downloads/
