.PHONY: install
install: .venv/bin/activate
	. .venv/bin/activate; python3 -m pip install --upgrade pip
	. .venv/bin/activate; python3 -m pip install -e .

.PHONY: test
test: install
	. .venv/bin/activate; sed -n '/^```python/,/^```/ p' < README.md | sed '/^```/d' | python

.PHONY: build
build: test
	. .venv/bin/activate; python3 -m pip install --upgrade build
	. .venv/bin/activate; python3 -m build

.PHONY: publish
publish: build
	. .venv/bin/activate; python3 -m pip install --upgrade twine
	. .venv/bin/activate; python3 -m twine upload dist/*

.PHONY: clean
clean:
	rm -rf __pycache__ aioclient.egg-info dist

.venv/bin/activate:
	python3 -m venv .venv
