#!/bin/bash -i


#------ USAGE-----------------
# curl https://raw.githubusercontent.com/Micky774/tpu-vm/main/setup.sh -o setup.sh
# setup.sh
#-----------------------------

    sudo apt update
    sudo apt-get install git -y

    "${SHELL}" <(curl -L micro.mamba.pm/install.sh) <<< "\ny\ny\n\n"
    source ~/.bashrc

    micromamba create -n flax python~=3.10.0 gh <<< "y"
    micromamba activate flax
    pip install jax[tpu] -f https://storage.googleapis.com/jax-releases/libtpu_releases.html

    git clone https://github.com/micky774/flax
    cd flax
    pip install -e ".[all]"
    pip install -e ".[testing]"
    pip install -r docs/requirements.txt
    pip install pre-commit
    pre-commit install