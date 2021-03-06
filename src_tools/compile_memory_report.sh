#!/bin/bash -e
find build/x86_64/obj/ -name "*.timing" | xargs grep 'Maximum resident' | sed 's!build/[^\]*/mldb/!!;s!\.\([^.]\+\)\.[^.]*\.lo\.timing:\tMaximum resident set size (kbytes):!.\1\t!' | sort -nr -k2 | awk -F '\t' '{ printf("%7.2fM\t%s\n", $2 / 1000.0, $1); }'
