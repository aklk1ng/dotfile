function gll
  if string length -q -- $argv[1]
    git --no-pager log --date=format:'%Y-%m-%d %H:%M' --pretty=format:"%C(magenta)%h %C(cyan)%s%Creset" --graph -n $argv[1]
  else
    set n 5
    git --no-pager log --date=format:'%Y-%m-%d %H:%M' --pretty=format:"%C(magenta)%h %C(cyan)%s%Creset" --graph -n $n
  end
end
