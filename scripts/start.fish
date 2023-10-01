#!/usr/bin/env fish


function usage
    echo "Usage: start.fish ComfyUI|Fooocis-MRE"
    exit 1
end

if test (count $argv) -ne 1
  usage
end


switch $argv[1]
  case 'ComfyUI'
    docker compose run --service-ports comfy-ui
  case 'Fooocus-MRE'
    docker compose run --service-ports comfy-ui
  case '*'
    usage
end
