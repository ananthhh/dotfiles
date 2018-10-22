prompt_install() {
    echo -n "$1 is not installed. Would you like to install it? (y/n) " >&2
    old_stty_cfg=$(stty -g)
    stty raw -echo
    answer=$( while ! head -c 1 | grep -i '[ny]' ;do true ;done )
    stty $old_stty_cfg && echo
    if echo "$answer" | grep -iq "^y" ;then
        brew install $1
    fi
}

check_for_software() {
    echo "Checking to see if $1 is installed"
    if ! [ -x "$(command -v $1)" ]; then
        prompt_install $1
    else
        echo "$1 is installed."
    fi
}


# Install general softwares
check_for_software zsh
echo 

check_for_software vim
echo

check_for_software tmux
echo

check_for_software fzf
echo

check_for_software git
echo

check_for_software neovim
echo

check_for_software fpp
echo

check_for_software tig
echo

check_for_software ripgrep
echo

check_for_software wakeonlan
echo

# Vim Related softwares
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo


# TMUX related softwares
check_for_software reattach-to-user-namespace
echo

# TMUX Plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
echo
