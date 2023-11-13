#!/usr/bin/env fish

if test (count $argv) -ne 1
    echo "Usage: build-image.fish <ComfyUI|Fooocus>"
end

set app (string lower $argv[1])

alias b 'docker compose build'

switch $app
case deps
    awk 'FNR==1{print ""}1' mount/ComfyUI/custom_nodes/**/requirements.txt > tmp.txt
    cat tmp.txt | sort | uniq > docker/comfy-nodes-requirements.txt
    rm tmp.txt
case comfy-ui
    b comfy-ui
case fooocus
    b fooocus
case '*'
    echo "======= build all ======="
    docker compose build {comfy-ui, fooocus}
end
