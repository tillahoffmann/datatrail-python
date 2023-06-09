copyright = "2023"
extensions = [
    "sphinx.ext.doctest",
    "myst_parser",
    "sphinx_rtd_theme",
]
exclude_patterns = [
    ".ipynb", "**/.ipynb",
    ".ipynb_checkpoints", "**/.ipynb_checkpoints",
    "README.md",
    "sandbox",
]
html_css_files = ["datatrail-python.css"]
html_static_path = ["_static"]
html_theme = "sphinx_rtd_theme"
project = "DataTrail"
