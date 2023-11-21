#------ USAGE-----------------
# curl https://gist.githubusercontent.com/Micky774/7d5b38478d9a9556142ecf01856d1a88/raw/e467dfd604656d97cf441e5282f8dc281d375a18/tpu_start.sh | bash
#-----------------------------

sudo apt update
sudo apt-get install git -y

"${SHELL}" <(curl -L micro.mamba.pm/install.sh) << START_ARGS

y
y

START_ARGS

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
