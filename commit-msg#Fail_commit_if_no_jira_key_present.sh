#!/bin/sh
# Rejects commit messages not starting with a Jira key [XXX-999] (Square brackes are optional)

[[ $(head $1) =~ ^\[?[A-Z][A-Z_0-9]+-[0-9]+.* ]] && exit 0

cat << EOF
╔═╗┌─┐┌┬┐┌┬┐┬┌┬┐  ╦═╗┌─┐ ┬┌─┐┌─┐┌┬┐┌─┐┌┬┐
║  │ ││││││││ │   ╠╦╝├┤  │├┤ │   │ ├┤  ││
╚═╝└─┘┴ ┴┴ ┴┴ ┴   ╩╚═└─┘└┘└─┘└─┘ ┴ └─┘─┴┘

EOF

echo "Commit message does not start with a valid Jira issue key XXX-999"

exit 1
