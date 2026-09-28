#!/usr/bin/env bash

set -euo pipefail


#DRY-RUN    of the sync and
rsync -avh --exclude='*.sh' --exclude='*.md --delete --remove-source-files --progress ~/dot-fastfetch/ ~/config/

#ask a question
read -r -p "Continue with the config file initialization ? [y/n] " answer

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
