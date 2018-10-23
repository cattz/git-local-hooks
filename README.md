# Git local hooks

This is a collection of useful git local hooks.
The hoooks scripts are named using this format: `<hook-type>#<Short_description>.sh`
For more information about hook types, check the [Git documentation](https://git-scm.com/docs/githooks)

In order to use this hooks you will need to install them per **local** repository

* `commit-msg#Fail_commit_if_no_jira_key_present` Will prevent you from comitting if your commit message does not start with a Jira issue key
* `prepare-commit-msg#Insert_jira_issue_from_branch.sh` When you are in a branch with a jira issue in its name, this hook will automatically prepend the Jira issue key to every commit message.

## How to install git local hooks

The below instructions are valid for Linux/macOS or Git Bash (Windows)

1. Copy or clone this hooks somewhere in your machine, for example `~/repos/git-local-hooks`

``` bash
git clone URL ~/repos/git-local-hooks
```

2. From the root of the repo where you want to install the hooks into:

``` bash
ln -s ~/repos/git-local-hooks/<HOOK-SCRIPT> .git/hooks/<HOOK-TYPE>
```

### Example

``` bash
cd my-repo
ln -s ~/repos/git-local-hooks/commit-msg#Fail_commit_if_no_jira_key_present.sh .git/hooks/commit-msg
ln -s ~/repos/git-local-hooks/prepare-commit-msg#Insert_jira_issue_from_branch.sh .git/hooks/prepare-commit-msg
```
