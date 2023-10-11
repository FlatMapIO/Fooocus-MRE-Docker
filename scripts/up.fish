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
        echo ">>> pulling $dir"
        git pull
        echo "✅ $dir updated"
        prevd
    end

end


function ensure_dir
    set -l dir $argv[1]
    if test -z $dir
        echo "Usage: ensure_dir <directory>"
        exit 1
    end
    if not test -d $dir
        mkdir -p $dir
    end
end


function fooocus_postinstall

    ensure_dir mount/Fooocus-MRE/repositories
    ensure_dir mount/Fooocus/repositories

    if not test -d mount/Fooocus/repositories/ComfyUI-from-StabilityAI-Official
        git clone https://github.com/comfyanonymous/ComfyUI mount/Fooocus/repositories/ComfyUI-from-StabilityAI-Official
    else
        cd  mount/Fooocus/repositories/ComfyUI-from-StabilityAI-Official
        git fetch

        set -l COMFY_COMMIT_HASH \
            (curl -sSL https://raw.githubusercontent.com/lllyasviel/Fooocus/main/launch.py \
            |  rg  -o '\'COMFY_COMMIT_HASH\',\s"([0-9a-f]{40})"\)' -r '$1')

        if test -z $COMFY_COMMIT_HASH
            echo "COMFY_COMMIT_HASH not found"
            exit 1
        end
        echo "[Fooocus] COMFY_COMMIT_HASH: $COMFY_COMMIT_HASH"

        git checkout $COMFY_COMMIT_HASH
        cd $ROOT_DIR
    end



    if not test -d mount/Fooocus-MRE/repositories/ComfyUI-from-StabilityAI-Official
        git clone https://github.com/comfyanonymous/ComfyUI mount/Fooocus-MRE/repositories/ComfyUI-from-StabilityAI-Official
    else
        cd  mount/Fooocus-MRE/repositories/ComfyUI-from-StabilityAI-Official
        git fetch

        set -l COMFY_COMMIT_HASH \
            (curl -sSL https://raw.githubusercontent.com/MoonRide303/Fooocus-MRE/moonride-main/launch.py \
            |  rg  -o '\'COMFY_COMMIT_HASH\',\s"([0-9a-f]{40})"\)' -r '$1')

        if test -z $COMFY_COMMIT_HASH
            echo "COMFY_COMMIT_HASH not found"
            exit 1
        end
        echo "[Fooocus-MRE] COMFY_COMMIT_HASH: $COMFY_COMMIT_HASH"

        git checkout $COMFY_COMMIT_HASH
        cd $ROOT_DIR
    end


    rsync -av \
        Fooocus/models/prompt_expansion/fooocus_expansion/ \
        mount/storage/models/prompt_expansion/fooocus_expansion/
    echo "✅ models/prompt_expansion/fooocus_expansion synced"
end

function install_fooocus
    clone_up https://github.com/lllyasviel/Fooocus.git Fooocus
    clone_up https://github.com/MoonRide303/Fooocus-MRE.git Fooocus-MRE

    fooocus_postinstall
end


function install_comfy_ui
    clone_up https://github.com/comfyanonymous/ComfyUI.git ComfyUI

    set -l dir  $dir
    clone_up https://github.com/ltdrdata/ComfyUI-Manager.git $dir/ComfyUI-Manager


    # Custom nodes
    clone_up https://github.com/ltdrdata/ComfyUI-Impact-Pack.git $dir/ComfyUI-Impact-Pack
    clone_up https://github.com/shingo1228/ComfyUI-SDXL-EmptyLatentImage.git $dir/ComfyUI-SDXL-EmptyLatentImage
    clone_up https://github.com/ltdrdata/ComfyUI-Inspire-Pack.git $dir/ComfyUI-Inspire-Pack
    clone_up https://github.com/Fannovel16/comfyui_controlnet_aux.git $dir/comfyui_controlnet_aux

    clone_up https://github.com/cubiq/ComfyUI_IPAdapter_plus.git $dir/ComfyUI_IPAdapter_plus
    clone_up https://github.com/SeargeDP/SeargeSDXL.git $dir/SeargeSDXL
    clone_up https://github.com/thedyze/save-image-extended-comfyui.git $dir/save-image-extended-comfyui
    clone_up https://github.com/ssitu/ComfyUI_fabric $dir/ComfyUI_fabric

end

install_fooocus
install_comfy_ui
