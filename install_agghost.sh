#!/bin/bash

# verifica si el script se ejecuta como root
if [[ "$EUID" -ne 0 ]]; then
    echo "este script debe ejecutarse como root. usa sudo."
    exit 1
fi

# definir la url del script y el destino
script_url="https://github.com/aressecc/agghost/blob/main/add_host_entry.sh"
script_path="$HOME/add_host_entry.sh"

# descargar el script
echo "descargando el script desde github..."
curl -s -L "$script_url" -o "$script_path"

# verificar si la descarga fue exitosa
if [[ ! -f "$script_path" ]]; then
    echo "hubo un error al descargar el script. verifica la url."
    exit 1
fi

# dar permisos de ejecución al script
chmod +x "$script_path"

# agregar alias en el .bashrc y .zshrc
echo "añadiendo alias en .bashrc y .zshrc..."

# para bash
echo "alias addhost='bash $script_path'" >> "$HOME/.bashrc"

# para zsh
echo "alias addhost='bash $script_path'" >> "$HOME/.zshrc"

# recargar los archivos de configuración
echo "recargando .bashrc y .zshrc..."
source "$HOME/.bashrc"
source "$HOME/.zshrc"

echo "instalación completada. ahora puedes usar el comando 'addhost' para ejecutar el script."
