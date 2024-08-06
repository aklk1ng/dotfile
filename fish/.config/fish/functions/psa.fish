function psa --description "Check a process"
    ps -aux | grep $argv[1] | grep -v grep
end
