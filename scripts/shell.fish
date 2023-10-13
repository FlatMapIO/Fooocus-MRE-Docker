#!/usr/bin/env fish

docker run --rm -it \
  --user vscode \
  --gpus all \
  huodon/pytorch-devcontainer:121 fish