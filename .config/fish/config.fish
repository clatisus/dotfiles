set fish_greeting ""

source ~/.config/fish/aliases.fish
source ~/.config/fish/path.fish

zoxide init fish | source

# for work
source ~/.config/fish/airbnb.fish

set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin $PATH /Users/junjie_wu/.ghcup/bin # ghcup-env

fish_add_path /opt/homebrew/opt/llvm@12/bin

pyenv init - | source
