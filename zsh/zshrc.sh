# Vars
    HISTFILE=~/.zsh_history
    SAVEHIST=1000 
    setopt inc_append_history # To save every command before it is executed 
    setopt share_history # setopt inc_append_history

# Settings
    export VISUAL=vim

source ~/dotfiles/zsh/plugins/fixls.zsh

# For vim mappings: 
    stty -ixon

# Oh My Zsh
export ZSH=~/dotfiles/zsh/plugins/oh-my-zsh
plugins=(git, docker)
source $ZSH/oh-my-zsh.sh

source ~/dotfiles/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/dotfiles/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/dotfiles/zsh/plugins/vi-mode.plugin.zsh

# Fix for arrow-key searching
# start typing + [Up-Arrow] - fuzzy find history forward
if [[ "${terminfo[kcuu1]}" != "" ]]; then
    autoload -U up-line-or-beginning-search
    zle -N up-line-or-beginning-search
    bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search
fi
# start typing + [Down-Arrow] - fuzzy find history backward
if [[ "${terminfo[kcud1]}" != "" ]]; then
    autoload -U down-line-or-beginning-search
    zle -N down-line-or-beginning-search
    bindkey "${terminfo[kcud1]}" down-line-or-beginning-search
fi

if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi


