#!/bin/bash -i

#------ USAGE-----------------
# curl https://raw.githubusercontent.com/Micky774/tpu-vm/main/setup.sh -o setup.sh
# . ./setup.sh
#-----------------------------

sudo apt update
sudo apt-get install git -y

"${SHELL}" <(curl -L micro.mamba.pm/install.sh) <<< "\ny\ny\n\n"
source ~/.bashrc

micromamba create -n generic python~=3.10.0 gh <<< "y"
micromamba activate generic

# Additional setup scripts
curl https://raw.githubusercontent.com/Micky774/tpu-vm/main/xla_setup.sh -o xla_setup.sh
curl https://raw.githubusercontent.com/Micky774/tpu-vm/main/flax_setup.sh -o flax_setup.sh
curl https://raw.githubusercontent.com/Micky774/tpu-vm/main/jax_setup.sh -o jax_setup.sh

# Aliases
alias bzbuild="bazel build --test_output=all --spawn_strategy=sandboxed //xla/..."