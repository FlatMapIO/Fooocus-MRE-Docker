#!/usr/bin/env fish


echo 'Remove all stoped containers'

docker rm (docker ps --filter status=exited -q)