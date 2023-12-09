#!/bin/bash

cd ~
mkdir bin
wget https://github.com/bazelbuild/bazelisk/releases/download/v1.19.0/bazelisk-linux-amd64 -o bin/bazel
chmod +x bin/bazel
sudo dpkg -i cuda-keyring_1.1-1_all.deb
sudo apt update
sudo apt install cuda-toolkit-12-3 libcudnn8-dev
git clone https://github.com/Micky774/xla.git
cd xla