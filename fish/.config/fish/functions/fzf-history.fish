function fzf-history -d "Show command history"
    test -n "$FZF_TMUX_HEIGHT"; or set FZF_TMUX_HEIGHT 40%
    begin
        set -lx FZF_DEFAULT_OPTS $FZF_DEFAULT_OPTS --scheme=history --no-preview

        set -l FISH_MAJOR (echo $version | cut -f1 -d.)
        set -l FISH_MINOR (echo $version | cut -f2 -d.)

        # history's -z flag is needed for multi-line support.
        # history's -z flag was added in fish 2.4.0, so don't use it for versions
        # before 2.4.0.
        if [ "$FISH_MAJOR" -gt 2 -o \( "$FISH_MAJOR" -eq 2 -a "$FISH_MINOR" -ge 4 \) ]
            builtin history -z | eval (__fzfcmd) --read0 --print0 -q '(commandline)' | read -lz result
            and commandline -- $result
        else
            builtin history | eval (__fzfcmd) -q '(commandline)' | read -l result
            and commandline -- $result
        end
    end
    commandline -f repaint
end
