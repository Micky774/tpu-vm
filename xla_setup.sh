#!/bin/bash

cd ~
mkdir bin
wget https://github.com/bazelbuild/bazelisk/releases/download/v1.19.0/bazelisk-linux-amd64 -O bin/bazel
chmod +x bin/bazel
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-keyring_1.1-1_all.deb
sudo dpkg -i cuda-keyring_1.1-1_all.deb
sudo apt update
sudo apt install -y cuda-toolkit-12-3 libcudnn8-dev
git clone https://github.com/Micky774/xla.git
cd xla