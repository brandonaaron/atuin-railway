#!/bin/bash

variables=("ATUIN_HOST" "ATUIN_PORT" "ATUIN_OPEN_REGISTRATION" "ATUIN_DB_URI" "ATUIN_PAGE_SIZE")
unset_variables=()

for var in "${variables[@]}"; do
  if [[ -z "${!var}" ]]; then
    unset_variables+=("$var")
  fi
done

if [ ${#unset_variables[@]} -ne 0 ]; then
  echo "The following environment variables are not set: ${unset_variables[*]}"
  exit 1
fi

for var in "${variables[@]}"; do
  escaped_value=$(echo "${!var}" | sed 's/\//\\\//g')
  sed -i "s/$var/$escaped_value/g" /config/server.toml
done

atuin server start