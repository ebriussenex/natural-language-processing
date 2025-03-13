export CODE=./week**/*.ipynb

format:
	nbqa black $(CODE) --line-length=120
	nbqa isort $(CODE)
	nbqa ruff --fix-only $(CODE)

lint:
	nbqa black --check $(CODE)
	nbqa flake8 --jobs 1 --statistics --show-source $(CODE)
	nbqa pylint --jobs 1 --rcfile=pyproject.toml $(CODE)
	nbqa ruff $(CODE)
	nbqa mypy $(CODE)
