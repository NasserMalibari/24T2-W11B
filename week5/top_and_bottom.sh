

top_and_bottom() {
    echo "$1"
    echo '-----------------'
    head -1 "$1"
    tail -1 "$1"
    echo ""
}

# hello.sh "*"

top_and_bottom "$1"