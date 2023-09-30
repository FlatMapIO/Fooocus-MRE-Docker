FROM huodon/pytorch-devcontainer:118

USER vscode

ENV PATH=:/home/vscode/.local/bin:$PATH

WORKDIR /workspace/FooocusMRE

RUN pip install \
  fastapi \
  pygit2 \
  gradio \
  omegaconf \
  pytorch_lightning \
  numpy \
  psutil \
  tqdm \
  scipy \
  Pillow \
  pyyaml \
  aiohttp \
  accelerate \
  safetensors \
  transformers \
  einops \
  torchsde