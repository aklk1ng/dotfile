function fish_prompt --description 'Write out the prompt'
    # PWD
    set_color C2BD9F
    echo -n (prompt_pwd)
    set_color normal

    set -q __fish_git_prompt_showdirtystate
    or set -g __fish_git_prompt_showdirtystate 1
    set -q __fish_git_prompt_showcolorhints
    or set -g __fish_git_prompt_showcolorhints 1
    set -q __fish_git_prompt_color_dirtystate
    or set -g __fish_git_prompt_color_dirtystate yellow
    set -q __fish_git_prompt_char_dirtystate
    or set -g __fish_git_prompt_char_dirtystate '⚡'
    set -q __fish_git_prompt_color_branch
    or set -g __fish_git_prompt_color_branch purple
    fish_vcs_prompt '|%s'
    echo

    echo -n '$ '
    set_color normal
end
