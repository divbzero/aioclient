.PHONY: install
install: .venv/bin/activate
	. .venv/bin/activate; python3 -m pip install --upgrade pip
	. .venv/bin/activate; python3 -m pip install -e .

.PHONY: test
test: install
	. .venv/bin/activate; sed -n '/^```python/,/^```/ p' < README.md | sed '/^```/d' | python

.venv/bin/activate:
	python3 -m venv .venv
