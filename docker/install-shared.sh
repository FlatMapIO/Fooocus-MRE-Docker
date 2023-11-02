#!/usr/bin/env bash

sudo sed -i 's/archive.ubuntu.com/mirrors.tuna.tsinghua.edu.cn/g' /etc/apt/sources.list

sudo apt update

sudo apt install -y libgl1-mesa-dev libglib2.0-0

sudo rm -rf /var/lib/apt/lists/*

pip3 install --upgrade pip
pip3 config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple