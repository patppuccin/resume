#!/usr/bin/env bash

variants=(content/*.yaml)

if [ ! -f "${variants[0]}" ]; then
  echo "No variants found"
  exit 1
fi

echo "Found ${#variants[@]} variants:"
for f in "${variants[@]}"; do
  name=$(basename "$f" .yaml)
  size=$(du -k "$f" | cut -f1)
  printf "  - %s  \033[90m(%.1f KB)\033[0m\n" "$name" "$size"
done