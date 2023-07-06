function te
  if string length -q -- $argv[1]
    tree -L $argv[1] --gitignore
  else
    tree -L 2 --gitignore
  end
end
