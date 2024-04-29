function fzf-git-status
    if not git rev-parse --git-dir >/dev/null 2>&1
        echo 'fzf-git-status: Not in a git repository.' >&2
    else
        set -f selected_paths (
            git -c color.status=always status --short |
            eval (__fzfcmd) --ansi \
                --multi \
                --nth="2.." \
                --no-preview
            )
        if test $status -eq 0
            # git status --short automatically escapes the paths of most files for us so not going to bother trying to handle
            # the few edges cases of weird file names that should be extremely rare (e.g. "this;needs;escaping")
            set -f cleaned_paths

            for path in $selected_paths
                if test (string sub --length 1 $path) = R
                    # path has been renamed and looks like "R LICENSE -> LICENSE.md"
                    # extract the path to use from after the arrow
                    set --append cleaned_paths (string split -- "-> " $path)[-1]
                else
                    set --append cleaned_paths (string sub --start=4 $path)
                end
            end

            commandline --current-token --replace -- (string join ' ' $cleaned_paths)
        end
    end
    commandline --function repaint
end
