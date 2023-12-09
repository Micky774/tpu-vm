#!/bin/bash

git clone https://github.com/micky774/flax
cd flax
pip install -e ".[all]"
pip install -e ".[testing]"
pip install -r docs/requirements.txt
pip install pre-commit
pre-commit install
