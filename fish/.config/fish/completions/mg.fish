function __list_plugins
    set plugins_dir $XDG_DATA_HOME/nvim/site/pack/plugins/opt
    if test -d $plugins_dir
        for dir in $plugins_dir/*
            if test -d $dir
                echo (basename $dir)
            end
        end
    end
end

complete -c mg -f -n __fish_use_subcommand -a 'install update remove sync log'
complete -c ./mg -f -n __fish_use_subcommand -a 'install update remove sync log'
complete -c ../mg -f -n __fish_use_subcommand -a 'install update remove sync log'

complete -c mg -f -n '__fish_seen_subcommand_from sync' -a '(__list_plugins)'
complete -c ./mg -f -n '__fish_seen_subcommand_from sync' -a '(__list_plugins)'

complete -c ../mg -f -n '__fish_seen_subcommand_from sync' -a '(__list_plugins)'
