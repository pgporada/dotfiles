# Overview
Symlink these files into your home directory

    git clone https://github.com/pgporada/dotfiles
    ln -s dotfiles/.vimrc .
    # You get the point.

- - - -
# Useful aliases for ~/.bashrc

    alias dc='cd'
    alias diff='colordiff'
    alias egrep='egrep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias grep='grep --color=auto'
    alias gti='git'
    alias l='ls -CF'
    alias la='ls -A'
    alias less='less -R'
    alias ll='ls -alF'
    alias ls='ls --color=auto'
    alias nethack-online='ssh nethack@nethack.alt.org ; clear'
    alias tmux='tmux -2'
    alias tron-online='ssh sshtron.zachlatta.com ; clear'
    alias emacs='vim'

- - - -
# Cool tools

You should really [check this guys project out](https://github.com/adrienverge/yamllint) if you're writing Ansible or Salt.

I add this alias to my `~/.bashrc`

    alias yams='find . -type f -name "*.yml*" -exec yamllint -f parsable {} \; | sed "s|\./||g" | egrep -v "(\.kitchen/|\[warning\])"'

Inside of one of my ansible projects I can then run

    yams
