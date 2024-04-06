function fzf-git-status
    if not git rev-parse --git-dir >/dev/null 2>&1
        echo 'fzf-git-status: Not in a git repository.' >&2
    else
        git -c color.status=always status --short | eval (__fzfcmd) --ansi --multi --nth="2.." --no-preview
    end
    commandline --function repaint
end
