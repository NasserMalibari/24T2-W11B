#!/bin/dash

mlalias 'cs2041.tue11-strings' | 
grep -E '^\s*z[0-9]{7}' | # grab zIDs 
sed -E 's/@.*//' | # remove email part
sed -E 's/^\s*//' | sort  # remove starting space