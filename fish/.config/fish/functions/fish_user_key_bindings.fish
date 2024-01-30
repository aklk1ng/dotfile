function fish_user_key_bindings
    fish_vi_key_bindings

    bind -M insert \ca beginning-of-line
    bind -M insert \ce end-of-line
    for mode in insert default visual
        bind -M $mode \cf forward-char
    end
end
