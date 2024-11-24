### Must have tools

- [kitty](https://sw.kovidgoyal.net/kitty/)
- [fish](https://fishshell.com/)

#### Brew
- [zoxide](https://github.com/ajeetdsouza/zoxide)
- [trash](https://hasseg.org/trash/)
- [pyenv](https://github.com/pyenv/pyenv)
- [tldr](https://github.com/tldr-pages/tldr)
- [lazygit](https://github.com/jesseduffield/lazygit)
- [jq](https://jqlang.github.io/jq/)
- [fzf](https://github.com/junegunn/fzf)
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [fd](https://github.com/sharkdp/fd)

#### Other tools
- [mosh](https://mosh.org/)
- [karabiner-elements](https://karabiner-elements.pqrs.org/)
- [alfred](https://www.alfredapp.com/)
- [ast-grep](https://ast-grep.github.io/)

### Language specific

#### Haskell

- [GHCup](https://www.haskell.org/ghcup/)

### Editor

#### Emacs

- [Doom Emacs](https://github.com/doomemacs/doomemacs)

#### Neovim

- [neovim](https://neovim.io/)
- [nvchad](https://nvchad.com/)
- [neovide](https://neovide.dev/)

### Steps to setup a new machine

1. Install `brew`, `kitty`, `fish`
2. Setup Github ssh keys
  - If the network's router and DNS is pointing to tvOS (which is using Stash), add the following in the `~/.ssh/config`
  - ```
    Host github.com
    Hostname ssh.github.com
    Port 443
    ```
3. Restore the dotfiles
  - ``` bash
    ~ % alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
    ~ % echo ".cfg" >> .gitignore
    ~ % git clone --bare git@github.com:clatisus/dotfiles.git $HOME/.cfg
    ~ % config checkout # If this fails, backup/remove the files and try again
    ~ % config config --local status.showUntrackedFiles no
    ```
4. Using `brew` to install tools as specified in [Must have tools#Brew](#brew)
5. Set `fish` as default shell (requires log-out and log-in after the change to take effect)
  - ``` bash
    ~ % echo /opt/homebrew/bin/fish | sudo tee -a /etc/shells
    ~ % chsh -s /opt/homebrew/bin/fish
    ```
