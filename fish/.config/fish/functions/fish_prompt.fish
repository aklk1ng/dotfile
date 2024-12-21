function fish_prompt --description 'Write out the prompt'
    set -l __last_command_exit_status $status

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


    set -l pwd (prompt_pwd)
    set -l vcs (fish_vcs_prompt '%s')
    set -l status_color (set_color -o cyan)
    if test $__last_command_exit_status != 0
        set status_color (set_color -o red)
    end
    set -l dollar "\n$status_color\$ "

    echo -n -e $pwd $vcs $dollar

end
