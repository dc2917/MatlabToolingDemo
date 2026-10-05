"""Configuration file for the Sphinx documentation builder."""

import os
import sys

sys.path.insert(0, os.path.abspath("../.."))


# -- Project information -----------------------------------------------------

project = "MatlabToolingDemo"
copyright = "2026, Dan Cummins"
author = "Dan Cummins"


# -- General configuration ---------------------------------------------------

extensions = [
    "sphinxcontrib.matlab",
    "sphinx.ext.autodoc",
    "sphinx.ext.napoleon",
    "sphinx_rtd_theme",
]

# Treat MATLAB as the default domain so you don't need the "mat:" prefix
primary_domain = "mat"

# Path to the root of the MATLAB source tree (absolute or relative to docs/source/)
matlab_src_dir = os.path.abspath("../../src")

# Optional style tweaks
matlab_show_property_specs = True   # raw arguments-block validators (size/class constraints) displayed alongside the docstring-derived types

# -- Options for HTML output -------------------------------------------------

html_theme = "sphinx_rtd_theme"
