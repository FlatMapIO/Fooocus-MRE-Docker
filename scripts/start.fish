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
    docker compose up -d comfy-ui
    docker compose logs -f comfy-ui
  case 'Fooocus-MRE'
    docker compose up -d fooocus-mre
    docker compose logs -f fooocus-mre
  case '*'
    usage
end
