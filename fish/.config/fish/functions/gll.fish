function gll
    if string length -q -- $argv[1]
        git --no-pager log --date=format:'%Y-%m-%d %H:%M' --pretty=format:"%C(magenta)%h %C(yellow)%cd %C(blue)%cn: %C(cyan)%s %C(red)%d%Creset" --graph -n $argv[1]
    else
        set n 10
        git --no-pager log --date=format:'%Y-%m-%d %H:%M' --pretty=format:"%C(magenta)%h %C(yellow)%cd %C(blue)%cn: %C(cyan)%s %C(red)%d%Creset" --graph -n $n
    end
end
