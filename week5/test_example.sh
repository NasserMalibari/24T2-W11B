#! /usr/bin/env dash

# ==============================================================================
# test00.sh
# test give-add command
#
# Written by: Dylan Brotherston <d.brotherston@unsw.edu.au>
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
usage: give-add <assignment> <solution> <autotests> <automarking>
EOF

# run our version
give-add a1 > "$actual_output" 2>&1

if ! diff "$expected_output" "$actual_output"; then
    echo "Failed test"
    exit 1
fi

# give-add <correct args>

# give-add <same correct args>
# >>> should give an error

# test give add but with incorrect filename format 

# test submitting file called _AUTOMARK


echo "Passed all tests!"