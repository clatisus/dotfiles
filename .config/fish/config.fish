set fish_greeting ""

source ~/.config/fish/aliases.fish
source ~/.config/fish/path.fish

zoxide init fish | source

# for work
set work_config ~/.config/fish/airbnb.fish
test -r $work_config; and source $work_config
set -e work_config

set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin $PATH $HOME/.ghcup/bin # ghcup-env

fish_add_path /opt/homebrew/opt/llvm@12/bin

pyenv init - | source
