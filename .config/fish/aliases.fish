# Navigation
function ..    ; cd .. ; end
function ...   ; cd ../.. ; end
function ....  ; cd ../../.. ; end
function ..... ; cd ../../../.. ; end

abbr rm trash -F

abbr g git
abbr gc git commit
abbr gco git checkout
abbr gp git push
abbr gl git pull

# is it a `main` or a `master` repo?
alias gitmainormaster="git branch --format '%(refname:short)' --sort=-committerdate --list master main | head -n1"
alias main="git checkout (gitmainormaster)"
alias master="main"

# rebase to merge base
alias rebase="git rebase -i (git merge-base master HEAD)"

function ll --wraps ls --description "List contents of directory using long format"
    ls -alh $argv
end

# dotfile git setup
# git init --bare $HOME/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
# config config --local status.showUntrackedFiles no

