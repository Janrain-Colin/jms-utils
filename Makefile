clean:
	python dev/clean.py

deploy: pypi
	git push --tags
	twine upload dist/*
	clean

deps:
	pip install -r requirements.txt
	pip install -r dev/requirements.txt

deps-upgrade:
	pip install -r requirements.txt --upgrade
	pip install -r dev/requirements.txt --upgrade

pypi:
	python setup.py sdist upload -r pypi

register:
	python setup.py register -r pypi

test: clean
	tox
