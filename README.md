# Overview
Symlink these files into your home directory

#### yamllint
I add this alias to my `~/.bashrc`

    alias yams='find . -type f -name "*.yml" -exec yamllint -f parsable {} \; | sed "s|\./||g" | egrep -v "(\.kitchen/|\[warning\])"'

