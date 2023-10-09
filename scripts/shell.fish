#!/usr/bin/env fish

docker run --rm -it \
  --user vscode \
  --gpus all \
  huodon/pytorch-devcontainer:118 bash -c 'python -m xformers.info; fish'