---
title: "Git"
date: 2025-01-13
draft: false
description: "Git version control commands and best practices"
tags: ["git", "version-control", "devops"]
---

# Git // TODO

- [Git Commands](#git-commands)
- [References](#see-also)

## Git Commands

- Commit Hash for DevOps

  Receive the currentcommit with the following built-in commands:

  ```bash
  git rev-parse HEAD
  ```

  Add the commit hash to an application:

  ```bash
  gcc main.c -o main -DGIT_COMMIT_HASH="$(git rev-parse HEAD)"
  ```

- List Contributors

  Rank all contributors locally based on their commits count with the following built-in commands:

  ```bash
  git shortlog -sn
  ```

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

## References

- Git [book](https://git-scm.com/book/en/v2) article.
- Git [support](https://git.logikum.hu/) article.
