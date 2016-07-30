#!/usr/bin/env bash

set -x

bash <(curl -fsSL https://raw.githubusercontent.com/Doodzik/osx_init/master/dev_env.sh)
bash <(curl -fsSL https://raw.githubusercontent.com/Doodzik/osx_init/master/apps.sh)
bash <(curl -fsSL https://raw.githubusercontent.com/Doodzik/osx_init/master/system_config.sh)

open ~/.dudzik.terminal

echo "Done. Restart Computer to take effect."

exit 0
