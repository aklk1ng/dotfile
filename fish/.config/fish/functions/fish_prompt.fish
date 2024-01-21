function fish_prompt --description 'Write out the prompt'
    set_color A09C87
    echo -n (prompt_pwd)
    set_color normal

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
    or set -g __fish_git_prompt_color_cleanstate magenta
    set -q __fish_git_prompt_char_cleanstate
    or set -g __fish_git_prompt_char_cleanstate '✓'
    set -q __fish_git_prompt_color_branch
    or set -g __fish_git_prompt_color_branch magenta
    set -q __fish_git_prompt_char_stateseparator
    or set -g __fish_git_prompt_char_stateseparator ''
    fish_vcs_prompt '|%s'
    echo

    echo -n '$ '
    set_color normal
end
