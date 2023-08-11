set -l PA $PATH

set -l manually_added_paths "

$HOME/.cargo/bin

"

for entry in (string split \n $manually_added_paths)
    # resolve the {$HOME} substitutions
    set -l resolved_path (eval echo $entry)
    if contains $resolved_path $PATH;
        continue; # skip dupes
    end
    if test -d "$resolved_path";
        set PA $PA "$resolved_path"
    end
end

set --export PATH $PA

eval "$(/opt/homebrew/bin/brew shellenv)"
