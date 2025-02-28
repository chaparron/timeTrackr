#!/bin/bash

# Función para eliminar contenedores
delete_containers() {
  echo "Deleting time-trackr containers..."
  docker ps -a --filter "name=time-trackr*" --format "{{.Names}}" | xargs -r docker rm -f
}

# Función para eliminar volúmenes
delete_volumes() {
  echo "Deleting time-trackr volumes..."
  docker volume ls --filter "name=time-trackr*" --format "{{.Name}}" | xargs -r docker volume rm -f
}

# Ejecutar las funciones
delete_containers
delete_volumes

exit 0