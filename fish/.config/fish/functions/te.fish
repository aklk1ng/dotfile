function te
    if string length -q -- $argv[1]
        eza -TL $argv[1] --git-ignore
    else
        eza -TL 2 --git-ignore
    end
end
