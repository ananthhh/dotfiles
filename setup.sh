#!/bin/bash

check_default_shell() {
    if [ -z "${SHELL##*zsh*}" ] ;then
            echo "Default shell is zsh."
    else
        echo -n "Default shell is not zsh. Do you want to chsh -s \$(which zsh)? (y/n)"
        old_stty_cfg=$(stty -g)
        stty raw -echo
        answer=$( while ! head -c 1 | grep -i '[ny]' ;do true ;done )
        stty $old_stty_cfg && echo
        if echo "$answer" | grep -iq "^y" ;then
            chsh -s $(which zsh)
        else
            echo "Warning: Your configuration won't work properly. If you exec zsh, it'll exec tmux which will exec your default shell which isn't zsh."
        fi
    fi
}

check_default_shell
echo

echo "Mapping ~/.zshrc"
printf "source '$HOME/dotfiles/zsh/zshrc_manager.sh'" > ~/.zshrc
echo

echo "Mapping ~/.config/nvim/init.vim"
printf "so $HOME/dotfiles/vim/vimrc.vim" > ~/.config/nvim/init.vim
echo

echo "Mapping ~/.tmux.conf"
printf "source-file $HOME/dotfiles/tmux/tmux.conf" > ~/.tmux.conf

echo "Mapping ~/.gitconfig"
(
cat <<End-of-message
[include]
    path = $HOME/dotfiles/git/gitconfig
End-of-message
) > ~/.gitconfig

echo "Mapping ~/.ideavimrc"
printf "source $HOME/dotfiles/vim/ideavimrc" > ~/.ideavimrc

echo
echo "Please log out and log back in for default shell to be initialized."
