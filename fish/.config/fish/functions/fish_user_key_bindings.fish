function fish_user_key_bindings
  fish_vi_key_bindings

  bind -s --preset \ch beginning-of-line
  bind -s --preset \cl end-of-line

  for mode in insert default visual
    bind -M $mode \cf forward-char
  end
end
