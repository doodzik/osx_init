## reset

* While booting press Cmd+R
* Click on Disk Utility
* Select the startup drive(Macintosh HD)
* switch to the Erase tab and choose Mac OS Extended (Journaled) from the Format drop-down menu. 
* Select Erase
* Quit out of the Disk Utility app
* Click on Reinstall OS X
* run basic/gui/dev script in CLI 

## runs all of the Underneath
bash <(curl -fsSL https://raw.githubusercontent.com/Doodzik/osx_init/master/all.sh)

## sets up basic dev environment
bash <(curl -fsSL https://raw.githubusercontent.com/Doodzik/osx_init/master/dev_env.sh)

## installs guis
bash <(curl -fsSL https://raw.githubusercontent.com/Doodzik/osx_init/master/apps.sh)

## configures system
bash <(curl -fsSL https://raw.githubusercontent.com/Doodzik/osx_init/master/system_config.sh)
