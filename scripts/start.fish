#!/usr/bin/env fish


function usage
    echo "Usage: start.fish ComfyUI|Fooocus|Fooocis-MRE"
    exit 1
end

if test (count $argv) -ne 1
  usage
end


function up
  set -l app $argv[1]
  docker compose up -d $app
  docker compose logs -f $app
end


up $argv[1]