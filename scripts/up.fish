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
        git clone --recursive $url $dir
        echo "✅ $dir Cloned"
    else
        cd $dir
        echo ">>> pulling $dir"
        git pull --recurse-submodules
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


# function fooocus_postinstall
#     rsync -av \
#         Fooocus/models/prompt_expansion/fooocus_expansion/ \
#         mount/storage/models/prompt_expansion/fooocus_expansion/
#     echo "✅ models/prompt_expansion/fooocus_expansion synced"
# end

function install_fooocus
    clone_up https://github.com/lllyasviel/Fooocus.git Fooocus

    # fooocus_postinstall
end

function install_comfy_ui
    clone_up https://github.com/comfyanonymous/ComfyUI.git ComfyUI

    set -l dir mount/ComfyUI/custom_nodes

    clone_up https://github.com/ltdrdata/ComfyUI-Manager.git $dir/ComfyUI-Manager

    # video
    clone_up https://github.com/Kosinkadink/ComfyUI-AnimateDiff-Evolved.git $dir/ComfyUI-AnimateDiff-Evolved
    clone_up https://github.com/Kosinkadink/ComfyUI-VideoHelperSuite $dir/ComfyUI-VideoHelperSuite

    # Face Swap
    clone_up https://github.com/Gourieff/comfyui-reactor-node.git $dir/comfyui-reactor-node


    # Custom nodes
    clone_up https://github.com/ltdrdata/ComfyUI-Impact-Pack.git $dir/ComfyUI-Impact-Pack
    clone_up https://github.com/shingo1228/ComfyUI-SDXL-EmptyLatentImage.git $dir/ComfyUI-SDXL-EmptyLatentImage
    clone_up https://github.com/ltdrdata/ComfyUI-Inspire-Pack.git $dir/ComfyUI-Inspire-Pack
    clone_up https://github.com/Fannovel16/comfyui_controlnet_aux.git $dir/comfyui_controlnet_aux

    clone_up https://github.com/Ttl/ComfyUi_NNLatentUpscale.git $dir/ComfyUi_NNLatentUpscale
    clone_up https://github.com/wallish77/wlsh_nodes.git $dir/wlsh_nodes
    clone_up https://github.com/failfa-st/failfast-comfyui-extensions.git $dir/failfast-comfyui-extensions
    clone_up https://github.com/TinyTerra/ComfyUI_tinyterraNodes.git $dir/ComfyUI_tinyterraNodes
    clone_up https://github.com/EllangoK/ComfyUI-post-processing-nodes.git $dir/ComfyUI-post-processing-nodes
    clone_up https://github.com/WASasquatch/was-node-suite-comfyui.git $dir/was-node-suite-comfyui
    clone_up https://github.com/RockOfFire/ComfyUI_Comfyroll_CustomNodes.git $dir/ComfyUI_Comfyroll_CustomNodes
    clone_up https://github.com/mav-rik/facerestore_cf.git $dir/facerestore_cf
    # broken
    clone_up https://github.com/ssitu/ComfyUI_restart_sampling $dir/ComfyUI_restart_sampling
    clone_up https://github.com/Stability-AI/stability-ComfyUI-nodes.git $dir/stability-ComfyUI-nodes
    clone_up https://github.com/hylarucoder/comfyui-copilot.git $dir/comfyui-copilot
    clone_up https://github.com/cubiq/ComfyUI_IPAdapter_plus.git $dir/ComfyUI_IPAdapter_plus
    clone_up https://github.com/SeargeDP/SeargeSDXL.git $dir/SeargeSDXL
    clone_up https://github.com/thedyze/save-image-extended-comfyui.git $dir/save-image-extended-comfyui
    clone_up https://github.com/ssitu/ComfyUI_fabric $dir/ComfyUI_fabric
    clone_up https://github.com/chrisgoringe/cg-image-picker.git $dir/cg-image-picker
    clone_up https://github.com/ssitu/ComfyUI_UltimateSDUpscale.git $dir/ComfyUI_UltimateSDUpscale
    clone_up https://github.com/jags111/efficiency-nodes-comfyui.git $dir/efficiency-nodes-comfyui
    clone_up https://github.com/ali1234/comfyui-job-iterator.git $dir/comfyui-job-iterator
    clone_up https://github.com/tusharbhutt/Endless-Nodes.git $dir/Endless-Nodes
    clone_up https://github.com/BlenderNeko/ComfyUI_Cutoff.git $dir/ComfyUI_Cutoff
    clone_up https://github.com/BlenderNeko/ComfyUI_TiledKSampler.git $dir/ComfyUI_TiledKSampler
    clone_up https://github.com/rgthree/rgthree-comfy.git $dir/rgthree-comfy
    clone_up https://github.com/martijnat/comfyui-previewlatent.git $dir/comfyui-previewlatent

    clone_up https://github.com/Kosinkadink/ComfyUI-AnimateDiff-Evolved.git $dir/ComfyUI-AnimateDiff-Evolved
    clone_up https://github.com/shiimizu/ComfyUI_smZNodes.git $dir/ComfyUI_smZNodes
    clone_up https://github.com/kijai/ComfyUI-KJNodes.git $dir/ComfyUI-KJNodes
    clone_up https://github.com/toyxyz/ComfyUI_toyxyz_test_nodes.git $dir/ComfyUI_toyxyz_test_nodes

    # clone_up https://github.com/ltdrdata/ComfyUI-Workflow-Component.git $dir/ComfyUI-Workflow-Component
    #
    #
    clone_up https://github.com/thecooltechguy/ComfyUI-Stable-Video-Diffusion.git $dir/ComfyUI-Stable-Video-Diffusion
end

install_fooocus
install_comfy_ui
