#------ USAGE-----------------
# curl https://raw.githubusercontent.com/Micky774/tpu-vm/main/setup.sh | bash
#-----------------------------

if [ $# -eq 0 ]
  then
    sudo apt update
    sudo apt-get install git -y

    "${SHELL}" <(curl -L micro.mamba.pm/install.sh) << START_ARGS

    y
    y

    START_ARGS
    exec "$startup.sh" dummy_arg
fi

source ~/.bashrc
micromamba create -n flax python~=3.10.0 <<< "y"
micromamba activate flax
pip install jax[tpu] -f https://storage.googleapis.com/jax-releases/libtpu_releases.html
micromamba install gh

git clone https://github.com/micky774/flax
cd flax
pip install -e ".[all]"
pip install -e ".[testing]"
pip install -r docs/requirements.txt
pip install pre-commit
pre-commit install
