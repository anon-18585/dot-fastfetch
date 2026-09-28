#!/usr/bin/env bash

set -euo pipefail

files=(
    config.jsonc
    logo
    logo/warp.png
    themes/
    themes/monochrome.jsonc
)

#ask a question
read -r -p "The Following files will be synchronized to ~/.config/fastfetch/. Do you want to continue ? [y/n] " answer
printf ' - %s\n' "${files[@]}"
echo

case "$answer" in
    [Yy]|[Yy][Ee][Ss])
      ;;
    [Nn]|[Nn][Oo])
        echo "."
        exit 0
        ;;
   *)
       echo {Invalid answer.}
       exit 1
       ;;
esac

rsync -arvhP --delete --dry-run ~/dot-fastfetch/fastfetch/ ~/config/fastfetch/
