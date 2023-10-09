#!/usr/bin/env fish

if test (count $argv) -ne 1
    echo "Usage: build-image.fish <ComfyUI|Fooocus-MRE>"
end

set app (string lower $argv[1])

switch $app
    case comfyui
        docker compose build comfy-ui
    case fooocus-mre
        docker compose build fooocus-mre
    case '*'
        echo "======= build all ======="
        docker compose build {comfy-ui, fooocus-mre}
end
