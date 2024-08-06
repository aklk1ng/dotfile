function ta --description "Convert a audio file extension with ffmpeg"
    set cnt (count $argv)
    if test $cnt -ne 2
        echo "Usage: ta input_file output_extension"
    else
        set ex (string match -r '\.([^.]+)$' $argv[1] --group 1)
        set name (basename -s $ex $argv[1])
        set new_file $name$argv[2]

        ffmpeg -i $argv[1] $new_file
        rm $argv[1]
    end
end
