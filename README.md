# .dots

## Overview
growing some configurations in the home directory

## Install
### recommended applications
- git
- gh
- tig
- vim

### how to setup
at first update the system, and install the upgradable list.
```sh
sudo apt update
sudo apt upgrade -y
```

install the recommended list.
```sh
sudo apt install git gh tig vim -y
```

clone the repo in the home directory.
```sh
git clone https://github.com/umrhug/.dots.git
```

launch the script file to configure the basic.
```sh
sh .dots/scripts/setup-interactive.sh
```

git clone this to your home directory, if you do not already have.
target directories and file
```sh
sh .dots/scripts/setup-interactive.sh
```

customize below
- install dein for customizing vim.
- link bash files.
- link git configurations.
- link tig configurations.
- make the initial directories.

