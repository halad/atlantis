#!/bin/bash

# Get repo absolute location for mounting
local_workdir=$(cd $(dirname $(dirname "${BASH_SOURCE[0]}")) >/dev/null 2>&1 && pwd)

main(){
# Working directory inside the container.
  local container_workdir=/go/src/github.com/runatlantis
  
  # Identifying container name.
  local container_name=go-runatlantis

 MSYS_NO_PATHCONV=1 docker run --rm -it \
    --name $container_name \
    --volume $local_workdir:$container_workdir \
    --workdir $container_workdir \
    golang
}

main