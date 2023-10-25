#!/usr/bin/env fish


function usage
    echo "Usage: start.fish comfy-ui|fooocus|fooocis-mre"
    exit 1
end

function up
  set -l app $argv[1]
  docker compose up -d $app
  docker compose logs -f $app
end

docker compose stop

switch "$argv[1]"
  case comfy-ui
    up comfy-ui
  case fooocus
    up fooocus
  case '*'
    usage
end
