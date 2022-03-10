# Git Hooks

[githooks](https://sentenz.github.io/backup-service/website/git-scm.com/docs/githooks) - Hooks used by Git are programs you can place in a hooks directory to trigger actions at certain points in git command. By default the hooks directory is `$GIT_DIR/hooks`.

Some of currently supported hooks are described below:

- [applypatch-msg](https://sentenz.github.io/backup-service/website/git-scm.com/docs/githooks#_applypatch_msg)
- [pre-applypatch](https://sentenz.github.io/backup-service/website/git-scm.com/docs/githooks#_pre_applypatch)
- [post-applypatch](https://sentenz.github.io/backup-service/website/git-scm.com/docs/githooks#_post_applypatch)
- [pre-commit](https://sentenz.github.io/backup-service/website/git-scm.com/docs/githooks#_pre_commit)
- [pre-merge-commit](https://sentenz.github.io/backup-service/website/git-scm.com/docs/githooks#_pre_merge_commit)
- [prepare-commit-msg](https://sentenz.github.io/backup-service/website/git-scm.com/docs/githooks#_prepare_commit_msg)
- [commit-msg](https://sentenz.github.io/backup-service/website/git-scm.com/docs/githooks#_commit_msg)
- [post-commit](https://sentenz.github.io/backup-service/website/git-scm.com/docs/githooks#_post_commit)
- [pre-rebase](https://sentenz.github.io/backup-service/website/git-scm.com/docs/githooks#_pre_rebase)
- [post-checkout](https://sentenz.github.io/backup-service/website/git-scm.com/docs/githooks#_post_checkout)
- [post-merge](https://sentenz.github.io/backup-service/website/git-scm.com/docs/githooks#_post_merge)
- [pre-push](https://sentenz.github.io/backup-service/website/git-scm.com/docs/githooks#_pre_push)
- [pre-receive](https://sentenz.github.io/backup-service/website/git-scm.com/docs/githooks#pre-receive)
- [update](https://sentenz.github.io/backup-service/website/git-scm.com/docs/githooks#update)
- [proc-receive](https://sentenz.github.io/backup-service/website/git-scm.com/docs/githooks#proc-receive)
- [post-receive](https://sentenz.github.io/backup-service/website/git-scm.com/docs/githooks#post-receive)
- [post-update](https://sentenz.github.io/backup-service/website/git-scm.com/docs/githooks#post-update)
- [reference-transaction](https://sentenz.github.io/backup-service/website/git-scm.com/docs/githooks#_reference_transaction)

## Useful Commands

- Normalizing Line Endings

  This command normalizes the line endings to the configuration in `.gitattributes`.

  ```bash
  git add --renormalize .
  git rm --cached -r .
  git reset --hard
  ```

  Verifying line endings.

  ```bash
  git ls-files --eol
  ```

- Diff

  This command shows the file differences which are not yet staged.

  ```bash
  git diff
  ```

  This command shows the differences between the two branches mentioned.

  ```bash
  git diff [first branch] [second branch]
  ```

- Amend

  Create a new message for last commit.

  ```bash
  git commit --amend
  ```

  Add a file to the last commit.

  > Append `--no-edit` to the commit command if you do not want to edit the `commit` message.

  ```bash
  git add <filename>
  git commit --amend
  ```

- Stashing

  Stash changes.

  ```bash
  git stash save
  ```

  Discard your stashed changes.

  ```bash
  git stash drop
  ```

  Apply and drop your stashed changes.

  ```bash
  git stash pop
  ```

- Refs and Log

  Use reflog to show the log of reference changes to HEAD.

  ```bash
  git reflog
  ```

  Check the Git history of a file.

  ```bash
  git log <file>
  ```

  Check the content of each change to a file.

  > Append `--follow` to the commit command, to follows it past file renames.

  ```bash
  gitk <file>
  ```

- Prune

Remove deleted and merged remote branches.

```bash
git fetch --prune
```

- Ignore

  Add it to .gitignore:

  ```bash
  echo <file> >> .gitignore
  ```

  Remove it from the index:

  ```bash
  git rm --cached <file>
  ```

  Add .gitignore to index:

  ```bash
  git add <file>
  ```

  Confirm:

  ```bash
  git status --ignored
  ```
