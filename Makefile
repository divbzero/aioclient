.PHONY: install
install: .venv/bin/activate
	. .venv/bin/activate; python3 -m pip install --upgrade pip
	. .venv/bin/activate; python3 -m pip install -e .

.venv/bin/activate:
	python3 -m venv .venv
