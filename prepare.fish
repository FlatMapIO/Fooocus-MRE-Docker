#!/usr/bin/env fish
function clone_up

  if test (count $argv) -ne 2
        echo "Usage: clone_up  <repository_url> <directory>"
        exit 1
  end

  set url $argv[1]
  set dir $argv[2]

  if not test -d $dir
    git clone --depth 1 $dir $url
  else
    cd $dir
    git pull
  end

end

function sync_prompt_expansion

  if not test -d ./mount/models
    echo "Please link models folder to ./mount/models"
    exit 1
  end

  rsync --ignore-existing -av  \
    source/models/prompt_expansion/fooocus_expansion/ \
    mount/models/prompt_expansion/fooocus_expansion/
end

clone_up  https://github.com/MoonRide303/Fooocus-MRE.git source
sync_prompt_expansion