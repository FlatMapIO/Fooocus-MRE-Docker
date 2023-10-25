#!/usr/bin/env fish

if test (count $argv) -ne 1
    echo "Usage: build-image.fish <ComfyUI|Fooocus|Fooocus-MRE>"
end

set app (string lower $argv[1])

alias b 'docker compose build'

switch $app
    case comfy-ui
        b comfy-ui
    case fooocus
        b fooocus
    case '*'
        echo "======= build all ======="
        docker compose build {comfy-ui, fooocus}
end
