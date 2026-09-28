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
echo "The Following files will be synchronized to ~/.config/fastfetch/. [y/n] "
printf ' - %s\n' "${files[@]}"
echo

read -r -p "Continue ? [y/n] " answer

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
