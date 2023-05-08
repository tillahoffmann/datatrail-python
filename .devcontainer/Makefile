requirements.txt : requirements.in
	docker run --rm -v `pwd`:/workspace -w /workspace python:3.10 bash -c \
		'pip install pip-tools && pip-compile -v --resolver=backtracking'

image : Dockerfile requirements.txt
	docker build -t datatrail-python .
