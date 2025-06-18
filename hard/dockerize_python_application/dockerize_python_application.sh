#!/usr/bin/env bash

cd app

vim Dockerfile
vim pyproject.toml
vim .dockerignore

source .venv/bin/activate
pip install pip-tools
python -m piptools compile -o requirements.txt pyproject.toml

make docker-build