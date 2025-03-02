#!/bin/bash

delete_containers() {
  echo "Deleting time-trackr containers..."
  docker ps -a --filter "name=time-trackr*" --format "{{.Names}}" | xargs -r docker rm -f
}

delete_volumes() {
  echo "Deleting time-trackr volumes..."
  docker volume ls --filter "name=timetrackr*" --format "{{.Name}}" | xargs -r docker volume rm -f
}

delete_containers
delete_volumes

exit 0