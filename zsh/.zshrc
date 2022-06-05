source ~/.profile
source ~/.zprofile

ZSH_THEME="gruvbox"
SOLARIZED_THEME="dark"

plugins=(git)

source $HOME/.oh-my-zsh/oh-my-zsh.sh

alias vi=nvim

# If entering zsh via WSL from mount, switch directory to home.
if [[ "$(pwd)" =~ ^\/mnt\/* ]] ;
then
    cd ~
fi

eval "$(starship init zsh)"

