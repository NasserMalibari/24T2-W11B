set -x

print_message() {
    # TODO: check $2 is a number, etc 

    if [ $# -eq 1 ]; then
        echo "Warning: $1" 1>&2 
    elif [ $# -eq 2 ]; then
        echo "Error: $1" 1>&2
        exit $2
    fi

}

print_message "this is a warning"
print_message "this is an error" 42