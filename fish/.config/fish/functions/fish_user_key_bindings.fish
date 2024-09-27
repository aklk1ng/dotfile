function fish_user_key_bindings
    fish_vi_key_bindings

    bind -M insert \ca beginning-of-line
    bind -M insert \ce end-of-line
    for mode in insert default visual
        bind -M $mode \cf accept-autosuggestion
    end

    for mode in insert default
        bind -M $mode \co fzf-open
        bind -M $mode \cr fzf-history
        bind -M $mode \cg fzf-git-status
        bind -M $mode \ck fzf-file
    end
end
