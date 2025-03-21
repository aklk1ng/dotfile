function fish_user_key_bindings
    fish_hybrid_key_bindings

    # Fuck ^_^
    # fish_vi_key_bindings.fish: bind -s --preset -M insert ctrl-n accept-autosuggestion
    bind -s --preset -M insert ctrl-n down-or-search

    for mode in insert default
        bind -M $mode \cr fzf-history
        bind -M $mode \cg fzf-git-status
        bind -M $mode \co fzf-file
    end
end
