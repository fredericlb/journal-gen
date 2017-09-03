#!/bin/bash
source <(sed -E -n 's/[^#]+/export &/ p' ./genrc.bash)

NEXT_SESSION_ID=$((SESSION_ID + 1))
echo "export SESSION_ID=${NEXT_SESSION_ID}" > genrc.bash
bash scripts/fetch.sh

echo "* Writing html file"
bash scripts/compile.sh > sessions/${SESSION_ID}.html
open -a "Chromium" sessions/${SESSION_ID}.html
