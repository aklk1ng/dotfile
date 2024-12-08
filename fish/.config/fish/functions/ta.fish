function ta --description "Convert multiple audio or video files to a new audio format with ffmpeg"
    set cnt (count $argv)
    if test $cnt -lt 2
        echo "Usage: ta input_files[...] output_extension"
    else
        set ext $argv[-1]
        set inputs $argv[1..-2]

        for input in $inputs
            set ex (string match -r '\.([^.]+)$' $input --group 1)
            set name (basename -s $ex $input)
            set new_file $name$ext

            ffmpeg -i $input $new_file
            rm $input
        end
    end
end
