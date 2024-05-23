/opt/homebrew/bin/brew shellenv | source

starship init fish | source
thefuck --alias | source
tmuxifier init - fish | source

abbr --add vi nvim
abbr --add gg lazygit

abbr --add ta tmux attach
abbr --add tml tmux ls
abbr --add tmn --set-cursor -- tmux new -s '"%"'
abbr --add tmlo tmuxifier load-session

abbr --add gs git switch
abbr --add gp git pull

alias l="lsd -A -l --blocks size,date,name --group-directories-first"

set -l os (uname)
if test "$os" = "Darwin"
  alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"
end

set fish_greeting

export EDITOR=nvim
export GIT_EDITOR=nvim

fish_add_path $HOME/bin

fzf_configure_bindings --directory=\cf
