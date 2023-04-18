#!/bin/bash

file="$1"
[ "${file:0:1}" == "/" ] || file="${PWD}/${file}"
pdffile="${file%.tex}.pdf"

# /usr/bin/osascript << EOF
#     tell application "PDF Expert"
#         activate
#         open POSIX file "${pdffile}" 
#     end tell
# EOF

/usr/bin/osascript << EOF
    tell application "System Events"
        set frontmostApplicationName to name of 1st process whose frontmost is true
    end tell
    set theFile to POSIX file "${pdffile}" as alias
        tell application "Skim"
        activate
        set theDocs to get documents whose path is (get POSIX path of theFile)
        if (count of theDocs) > 0 then revert theDocs
        open theFile 
    end tell
    tell application frontmostApplicationName
        activate
    end tell
EOF