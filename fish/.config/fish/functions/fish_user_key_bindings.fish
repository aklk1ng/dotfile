function fish_user_key_bindings
    for mode in insert default
        fish_default_key_bindings -M $mode
    end
    fish_vi_key_bindings --no-erase

    for mode in insert default
        bind -M $mode \co fzf-open
        bind -M $mode \cr fzf-history
        bind -M $mode \cg fzf-git-status
        bind -M $mode \ck fzf-file
    end
end
