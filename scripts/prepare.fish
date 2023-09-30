#!/usr/bin/env fish
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


function install_fooocus_mre_comfyui

    set COMFY_COMMIT_HASH 2381d36e6db8e8150e42ff2ede628db5b00ae26f

    if test -d ./mount/repositories/ComfyUI-from-StabilityAI-Official
        echo '✅ ./mount/repositories/ComfyUI-from-StabilityAI-Official exists'
        return
    end

    clone_up ./mount/repositories/ComfyUI-from-StabilityAI-Official https://github.com/comfyanonymous/ComfyUI
    cd ./mount/repositories/ComfyUI-from-StabilityAI-Official
    git checkout $COMFY_COMMIT_HASH
    prevd
end

function fooocus_sync_prompt_expansion

    if not test -d ./mount/models
        echo "❌ Please link models folder to ./mount/models"
        exit 1
    end

    rsync --ignore-existing -av \
        Fooocus-MRE/models/prompt_expansion/fooocus_expansion/ \
        mount/models/prompt_expansion/fooocus_expansion/
    echo "✅ mount/models/prompt_expansion/fooocus_expansion/ synced"
end

function install_fooocus_mre
    clone_up https://github.com/MoonRide303/Fooocus-MRE.git Fooocus-MRE
    install_fooocus_mre_comfyui
    fooocus_sync_prompt_expansion
end



function install_comfy_ui
    clone_up https://github.com/comfyanonymous/ComfyUI.git ComfyUI
    # Custom nodes
    clone_up https://github.com/ltdrdata/ComfyUI-Manager.git ./mount/custom_nodes/ComfyUI-Manager
    clone_up https://github.com/ltdrdata/ComfyUI-Impact-Pack.git ./mount/custom_nodes/ComfyUI-Impact-Pack
end

install_fooocus_mre
install_comfy_ui
