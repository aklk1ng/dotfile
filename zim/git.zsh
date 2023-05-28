hashColor=${gitHashColor:-"magenta"}
contentColor=${gitContentColor:-"cyan"}
dateColor=${gitDateColor:-"yellow"}
authorColor=${gitAuthorColor:-"blue"}

gitlog() {git --no-pager log --date=format:'%Y-%m-%d %H:%M' --pretty=format:$1 --graph -n ${2-10}}
gll() { gitlog "%C(${hashColor})%h %C(${contentColor})%s%Creset" $1 }
glll() { gitlog "%C(${hashColor})%h %C(${dateColor})%cd %C(${authorColor})$cn: %C(${contentColor})%s%Creset" $1 }
