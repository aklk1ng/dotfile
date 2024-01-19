set -l words g
complete -c grsu -f -n "__fish_is_git_repository -a not __fish_seen_subcommand_from $words" -a (basename (git rev-parse --show-toplevel))
complete -c grsu -f -n "__fish_is_git_repository -a __fish_seen_subcommand_from $words" -a (basename (git rev-parse --show-toplevel))
