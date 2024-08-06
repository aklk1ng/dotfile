function grsu --description "Convert the repo remote url"
    set cnt $(count $argv)
    if test $cnt -ne 1 -a $cnt -ne 2
        echo "Usage: grsu [g] repo_name"
    else
        set name (git config --get user.name)
        if test $argv[1] = "g"
            git remote set-url origin git@github.com:$name/$argv[2].git
        else
            git remote set-url origin https://github.com/$name/$argv[1].git
        end
    end
end
