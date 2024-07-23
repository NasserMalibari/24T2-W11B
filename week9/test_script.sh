#! /usr/bin/env dash

# ==============================================================================
# test00.sh
# Test the grip-add command when adding a removed a file
#
# Written by: Dylan Brotherston <d.brotherston@unsw.edu.au>
# + Nasser Malibari <>
# Date: 2024-03-10
# For COMP2041/9044 Assignment 1
# ==============================================================================

# add the current directory to the PATH so scripts
# can still be executed from it after we cd

PATH="$PATH:$(pwd)"

# Create a temporary directory for the test.
test_dir="$(mktemp -d)"
cd "$test_dir" || exit 1

# Create some files to hold output.

expected_output="$(mktemp)"
actual_output="$(mktemp)"

# Remove the temporary directory when the test is done.

trap 'rm "$expected_output" "$actual_output" -rf "$test_dir"' INT HUP QUIT TERM EXIT


cat > "$expected_output" <<EOF
Initialized empty grip repository in .grip
EOF

grip-init > "$actual_output" 2>&1

if ! diff "$actual_output" "$expected_output"; then
    echo "failed test"
    exit 1
fi

echo "hello" > file1

cat > "$expected_output" <<EOF
EOF
grip-add file1 > "$actual_output" 2>&1

if ! diff "$actual_output" "$expected_output"; then
    echo "failed test"
    exit 1
fi


# first commit

cat > "$expected_output" <<EOF
Committed as commit 0
EOF
grip-commit -m "first commit" > "$actual_output" 2>&1

if ! diff "$actual_output" "$expected_output"; then
    echo "failed test"
    exit 1
fi

# removing file from directory
rm file1


# adding removed file
cat > "$expected_output" <<EOF
EOF
grip-add file1 > "$actual_output" 2>&1

if ! diff "$actual_output" "$expected_output"; then
    echo "failed test"
    exit 1
fi


# comitting changes of removing file
cat > "$expected_output" <<EOF
Committed as commit 1
EOF
grip-add grip-commit -m "second commit" > "$actual_output" 2>&1

if ! diff "$actual_output" "$expected_output"; then
    echo "failed test"
    exit 1
fi


echo "Passed test!"


# Major note:
# Since .grip exists in current directory,
# we can't simultaneously run 2041 grip-* and our grip-*

# so can copy paste output OR run them in seperate directories

# Optional: Suggestions
# - create a helper function that 
#   runs both commands and checks output automatically

# - write fail message in red, and pass message in green :)

# once these are implemented, they may help you write some tests
# of earlier scripts

# grip-show
# grip-log

# stick to 'black-box' tests