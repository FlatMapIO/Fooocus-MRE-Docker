#!/usr/bin/env fish

if test (count $argv) -ne 1
    echo "Usage: build-image.fish <ComfyUI|Fooocus-MRE>"
    exit 1
end

set app (string lower $argv[1])

switch $app
    case comfyui
        docker compose build comfy-ui
    case fooocus-mre
        docker compose build fooocus-mre
    case '*'
        docker compose build {comfy-ui, fooocus-mre}
end
