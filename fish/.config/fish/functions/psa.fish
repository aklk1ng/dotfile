function psa
    ps -aux | grep $argv[1] | grep -v grep
end
