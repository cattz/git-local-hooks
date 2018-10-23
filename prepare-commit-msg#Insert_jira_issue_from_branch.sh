#!/bin/bash

# If the branch name contains a JIRA issue key XXX-999, pre-fills the commit message with that key
# For example, if we are on branch feature/FOO-10_feature and we commit, the key [FOO-10] 
# will be prepended to the commit message:

# feature/FOO-10_feature$ git commit -m"Changed something"
# feature/FOO-10_feature$ git log -1 --pretty=%B
# [FOO-10] Changed something


# Customize which branches should be skipped when prepending commit message. 
if [ -z "$BRANCHES_TO_SKIP" ]; then
  BRANCHES_TO_SKIP=(master develop)
fi

BRANCH_NAME=$(git symbolic-ref --short HEAD)
BRANCH_NAME="${BRANCH_NAME##*/}"

[[ "${BRANCH_NAME}" =~ ([A-Z][A-Z_0-9]+-[0-9]+).* ]] && JIRA_ISSUE=${BASH_REMATCH[1]} 

BRANCH_EXCLUDED=$(printf "%s\n" "${BRANCHES_TO_SKIP[@]}" | grep -c "^$BRANCH_NAME$")
BRANCH_IN_COMMIT=$(grep -c "\[$BRANCH_NAME\]" $1)

if [ -n "${JIRA_ISSUE}" ] && ! [[ $BRANCH_EXCLUDED -eq 1 ]] && ! [[ $BRANCH_IN_COMMIT -ge 1 ]]; then 
  sed -i.bak -e "1s/^/[${JIRA_ISSUE}] /" $1
fi
