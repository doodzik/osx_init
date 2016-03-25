#!/usr/bin/env bash

set -x

bash <(curl -fsSL https://raw.githubusercontent.com/Doodzik/osx_init/master/basic.sh)
bash <(curl -fsSL https://raw.githubusercontent.com/Doodzik/osx_init/master/dev.sh)
bash <(curl -fsSL https://raw.githubusercontent.com/Doodzik/osx_init/master/gui.sh)

open ~/.dudzik.terminal

echo "Done. Restart Computer to take effect."

exit 0
