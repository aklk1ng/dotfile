function fish_prompt --description 'Write out the prompt'
    set -l last_pipestatus $pipestatus
    set -lx __fish_last_status $status # Export for __fish_print_pipestatus.
    set -l normal (set_color normal)
    set -q fish_color_status
    or set -g fish_color_status red
    # Write pipestatus
    # If the status was carried over (if no command is issued or if `set` leaves the status untouched), don't bold it.
    set -q __fish_prompt_status_generation; or set -g __fish_prompt_status_generation $status_generation
    set __fish_prompt_status_generation $status_generation
    set -l status_color (set_color $fish_color_status)
    set -l statusb_color (set_color $bold_flag $fish_color_status)
    set -l prompt_status (__fish_print_pipestatus "[" "]" "|" "$status_color" "$statusb_color" $last_pipestatus)

    echo -n (prompt_pwd)

    set -q __fish_git_prompt_showdirtystate
    or set -g __fish_git_prompt_showdirtystate 1
    set -q __fish_git_prompt_showuntrackedfiles
    or set -g __fish_git_prompt_showuntrackedfiles 1
    set -q __fish_git_prompt_showcolorhints
    or set -g __fish_git_prompt_showcolorhints 1
    set -q __fish_git_prompt_color_untrackedfiles
    or set -g __fish_git_prompt_color_untrackedfiles yellow
    set -q __fish_git_prompt_char_untrackedfiles
    or set -g __fish_git_prompt_char_untrackedfiles '?'
    set -q __fish_git_prompt_color_invalidstate
    or set -g __fish_git_prompt_color_invalidstate red
    set -q __fish_git_prompt_char_invalidstate
    or set -g __fish_git_prompt_char_invalidstate '!'
    set -q __fish_git_prompt_color_dirtystate
    or set -g __fish_git_prompt_color_dirtystate blue
    set -q __fish_git_prompt_char_dirtystate
    or set -g __fish_git_prompt_char_dirtystate '*'
    set -q __fish_git_prompt_char_stagedstate
    or set -g __fish_git_prompt_char_stagedstate '✚'
    set -q __fish_git_prompt_color_cleanstate
    or set -g __fish_git_prompt_color_cleanstate green
    set -q __fish_git_prompt_char_cleanstate
    or set -g __fish_git_prompt_char_cleanstate '✓'
    set -q __fish_git_prompt_color_branch
    or set -g __fish_git_prompt_color_branch green
    set -q __fish_git_prompt_char_stateseparator
    or set -g __fish_git_prompt_char_stateseparator ''
    fish_vcs_prompt '|%s'
    echo -n " "$prompt_status
    echo

    set_color cyan
    echo -n '$ '
    set_color normal
end
