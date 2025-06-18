.PHONY: venv-create
venv-create:
        python -m venv .venv
        @echo "venv created. To activate it, run:"
        @echo "source .venv/bin/activate"

.PHONY: system-install
system-install:
        sudo apt-get update
        sudo apt-get install -y build-essential libcairo2 libcairo2-dev

.PHONY: install
install: system-install
        pip install -e .

.PHONY: run-dev
run-dev:
        uvicorn app.main:app --host 0.0.0.0 --port 3000 --reload

.PHONY: test
test:
        pytest

.PHONY: freeze-requirements
freeze-requirements:
        pip install pip-tools
        python -m piptools compile -o requirements.txt pyproject.toml

.PHONY: docker-build
docker-build:
        docker build -t registry.iximiuz.com/app:v1.0.0 .

.PHONY: docker-run
docker-run:
        docker run -p 3000:3000 registry.iximiuz.com/app:v1.0.0