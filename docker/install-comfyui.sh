#!/usr/bin/env  bash

function pip_install() {
  pip install --user --no-cache-dir ${@}
}

pip_install -r https://raw.githubusercontent.com/ltdrdata/ComfyUI-Impact-Pack/Main/requirements.txt
pip_install -r https://raw.githubusercontent.com/ltdrdata/ComfyUI-Inspire-Pack/main/requirements.txt
pip_install -r https://raw.githubusercontent.com/Fannovel16/comfyui_controlnet_aux/main/requirements.txt
pip_install -r https://raw.githubusercontent.com/ltdrdata/ComfyUI-Impact-Pack/Main/requirements.txt
pip_install -r https://raw.githubusercontent.com/ltdrdata/ComfyUI-Manager/main/requirements.txt
pip_install -r https://raw.githubusercontent.com/LucianoCirino/efficiency-nodes-comfyui/main/requirements.txt


pip_install -r https://raw.githubusercontent.com/THUDM/ImageReward/main/requirements.txt

pip_install \
  ultralytics \
  openmim \
  opencv-python \
  onnxruntime \
  image-reward \
  pytorch-lightning
