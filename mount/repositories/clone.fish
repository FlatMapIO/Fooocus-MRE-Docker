#!/usr/bin/env fish


if test -z $COMFY_COMMIT_HASH
  set COMFY_COMMIT_HASH '2381d36e6db8e8150e42ff2ede628db5b00ae26f'
end


if not test -d ComfyUI-from-StabilityAI-Official
  git clone https://github.com/comfyanonymous/ComfyUI ComfyUI-from-StabilityAI-Official
else
  cd ComfyUI-from-StabilityAI-Official
  git fetch
end

git checkout $COMFY_COMMIT_HASH
