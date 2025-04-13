#!/bin/bash

# Verifica si el script se ejecuta como root
if [[ "$EUID" -ne 0 ]]; then
    echo "Este script debe ejecutarse como root. Usa sudo."
    exit 1
fi

# Solicita ip y host al usuario
read -p "Introduce la ip: " ip
read -p "Introduce el nombre de host: " hostname

# Verifica si la entrada ya existe
if grep -qE "^\s*${ip}\s+.*\b${hostname}\b" /etc/hosts; then
    echo "La entrada '$ip $hostname' ya existe en /etc/hosts."
else
    echo "$ip    $hostname" >> /etc/hosts
    echo "Entrada añadida: $ip $hostname"
fi
