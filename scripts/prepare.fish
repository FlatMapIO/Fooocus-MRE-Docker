#!/usr/bin/env fish

set ROOT_DIR (pwd)

function clone_up

    if test (count $argv) -ne 2
        echo "Usage: clone_up  <repository_url> <directory>"
        exit 1
    end

    set url $argv[1]
    set dir $argv[2]

    if not test -d $dir
        git clone --depth 1 $url $dir
        echo "✅ $dir Cloned"
    else
        cd $dir
        git pull
        echo "✅ $dir updated"
        prevd
    end

end




function fooocus_mre_postinstall
    if not test -d ./mount/repositories/ComfyUI-from-StabilityAI-Official
        git clone --depth 1 https://github.com/comfyanonymous/ComfyUI ./mount/repositories/ComfyUI-from-StabilityAI-Official
    end

    cd ./mount/repositories/ComfyUI-from-StabilityAI-Official
    git fetch

    set COMFY_COMMIT_HASH \
        (curl -sSL https://raw.githubusercontent.com/MoonRide303/Fooocus-MRE/moonride-main/launch.py \
        |  rg  -o '\'COMFY_COMMIT_HASH\',\s"([0-9a-f]{40})"\)' -r '$1')

    echo "COMFY_COMMIT_HASH: $COMFY_COMMIT_HASH"

    git checkout $COMFY_COMMIT_HASH
    cd $ROOT_DIR
end

function fooocus_sync_prompt_expansion

    if not test -d ./mount/storage
        echo "❌ Please link storage folder to ./mount/storage"
        exit 1
    end

    rsync -av \
        Fooocus-MRE/models/prompt_expansion/fooocus_expansion/ \
        mount/storage/models/prompt_expansion/fooocus_expansion/
    echo "✅ models/prompt_expansion/fooocus_expansion synced"
end

function install_fooocus_mre
    clone_up https://github.com/MoonRide303/Fooocus-MRE.git Fooocus-MRE
    fooocus_mre_postinstall
    fooocus_sync_prompt_expansion
end


function install_comfy_ui
    clone_up https://github.com/comfyanonymous/ComfyUI.git ComfyUI
    clone_up https://github.com/ltdrdata/ComfyUI-Manager.git ./mount/custom_nodes/ComfyUI-Manager
    # Custom nodes
    clone_up https://github.com/ltdrdata/ComfyUI-Impact-Pack.git ./mount/custom_nodes/ComfyUI-Impact-Pack
    clone_up https://github.com/ltdrdata/ComfyUI-Inspire-Pack.git ./mount/custom_nodes/ComfyUI-Inspire-Pack
    clone_up https://github.com/Fannovel16/comfyui_controlnet_aux.git ./mount/custom_nodes/Comfyui-Controlnet-Auxs

    clone_up https://github.com/cubiq/ComfyUI_IPAdapter_plus.git ./mount/custom_nodes/ComfyUI_IPAdapter_plus
    clone_up https://github.com/SeargeDP/SeargeSDXL.git ./mount/custom_nodes/SeargeSDXL
end

install_fooocus_mre
install_comfy_ui
