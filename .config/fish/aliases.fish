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

# clean up local branches
alias gclean="git branch | grep -v '*' | grep -v master | xargs -I {} git branch -D {}"

# rename current branch
alias grename="git branch -m (git branch --show-current)"

# find and replace
function find_and_replace --description "Find and replace a string in all files in the current directory"
    set search $argv[1]
    set replace $argv[2]
    grep -rl "$search" ./ | xargs -I{} sed -i '' "s@""$search""@""$replace""@g" {}
end

function ll --wraps ls --description "List contents of directory using long format"
    ls -alh $argv
end

# dotfile git setup
# git init --bare $HOME/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
# config config --local status.showUntrackedFiles no

