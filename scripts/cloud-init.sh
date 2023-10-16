#!/usr/bin/env bash

echo '>>> config git'

git config --global user.name huodon
git config --global user.email huodon@gmail.com


fish_exec=$(which fish)

if [[ "$fish_exec" = "" ]]; then
  echo ">>> install fish"
  apt update
  apt install fish
fi
