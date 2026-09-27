#!/usr/bin/env bash

set -euo pipefail


#DRY-RUN    of the sync and
rsync -avh --exclude='*.sh' --exclude='*.md --delete --remove-source-files --progress ~/fastfetch ~/config/

#ask a question
read -r -p "Continue with the config file initialization ? [y/n] " answer

case "$answer" in
    [Yy]|[Yy][Ee][Ss])
      ;;
    [Nn]|[Nn][Oo])
        echo "Backup to external disk GOOGLE cancelled."
        exit 0
        ;;
   *)
       echo {Invalid answer. Backup cancelled.}
       exit 1
       ;;
esac
