.PHONY : clean docs image

docs :
	rm -rf docs/_build
	sphinx-build -W . docs/_build

doctests :
	sphinx-build -W -b doctest . docs/_build

clean :
	rm -rf echo **/.ipynb*

.devcontainer/requirements.txt : .devcontainer/requirements.in
	docker run --rm -v `pwd`/.devcontainer:/workspace -w /workspace python:3.10 bash -c \
		"pip install pip-tools && pip-compile -v --resolver=backtracking"

image : .devcontainer/Dockerfile .devcontainer/requirements.txt
	docker build -t datatrail-python .devcontainer
