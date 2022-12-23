# Githooks

[Hooks](https://git-scm.com/docs/githooks) are built-in features used by Git to trigger actions at certain points in git command. [Hooks](https://git-scm.com/book/en/v2/Customizing-Git-Git-Hooks) has a way to fire off custom scripts when certain important actions occur. There are two groups of these hooks: client-side and server-side.

- [1. Client-Side Hooks](#1-client-side-hooks)
  - [1.1. pre-commit](#11-pre-commit)
  - [1.2. prepare-commit-msg](#12-prepare-commit-msg)
  - [1.3. commit-msg](#13-commit-msg)
  - [1.4. post-commit](#14-post-commit)
  - [1.5. pre-rebase](#15-pre-rebase)
  - [1.6. post-checkout](#16-post-checkout)
  - [1.7. post-rewrite](#17-post-rewrite)
  - [1.8. post-merge](#18-post-merge)
  - [1.9. pre-push](#19-pre-push)
  - [1.10. applypatch-msg](#110-applypatch-msg)
  - [1.11. pre-applypatch](#111-pre-applypatch)
  - [1.12. post-applypatch](#112-post-applypatch)
- [2. Server-Side Hooks](#2-server-side-hooks)
  - [2.1. pre-receive](#21-pre-receive)
  - [2.2. update](#22-update)
  - [2.3. post-receive](#23-post-receive)
- [3. Configuration](#3-configuration)
- [4. References](#4-references)

## 1. Client-Side Hooks

Client-side hooks are triggered by operations such as committing and merging, while server-side hooks run on network operations such as receiving pushed commits. Use these hooks for all sorts of reasons.

> NOTE Client-side hooks are not copied when you clone a repository.

### 1.1. pre-commit

The [pre-commit](https://sentenz.github.io/backup-service/website/git-scm.com/docs/githooks#_pre_commit) hook is run first, before you even type in a commit message. It’s used to inspect the snapshot that’s about to be committed, to see if you’ve forgotten something, to make sure tests run, or to examine whatever you need to inspect in the code. Exiting non-zero from this hook aborts the commit, although you can bypass it with `git commit --no-verify`. You can do things like check for code style (run lint or something equivalent), check for trailing whitespace (the default hook does exactly this), or check for appropriate documentation on new methods.

Hook is invoked by `git-commit`.

Usage:

- Enforcing coding standards.

### 1.2. prepare-commit-msg

The [prepare-commit-msg](https://sentenz.github.io/backup-service/website/git-scm.com/docs/githooks#_prepare_commit_msg) hook is run before the commit message editor is fired up but after the default message is created. It lets you edit the default message before the commit author sees it. This hook takes a few parameters: the path to the file that holds the commit message so far, the type of commit, and the commit SHA-1 if this is an amended commit. This hook generally isn’t useful for normal commits; rather, it’s good for commits where the default message is auto-generated, such as templated commit messages, merge commits, squashed commits, and amended commits. You may use it in conjunction with a commit template to programmatically insert information.

Hook is invoked by `git-commit`.

Usage:

- Editing the commit message.

Parameters:

1. Name of the file that containing the commit log message.
2. Source of the commit message.

### 1.3. commit-msg

The [commit-msg](https://sentenz.github.io/backup-service/website/git-scm.com/docs/githooks#_commit_msg) hook takes one parameter, which again is the path to a temporary file that contains the commit message written by the developer. If this script exits non-zero, Git aborts the commit process, so use it to validate your project state or commit message before allowing a commit to go through according to the [Conventional Commits](../convention/conventional-commits.md).

Hook is invoked by `git-commit` and `git-merge`.

Usage:

- Enforce Conventional Commits to commit messages.

Parameters:

1. Name of the file that containing the proposed commit log message.

### 1.4. post-commit

The [post-commit](https://sentenz.github.io/backup-service/website/git-scm.com/docs/githooks#_post_commit) hook runs after the entire commit process is completed. It doesn’t take any parameters, but you can easily get the last commit by running `git log -1 HEAD`. Generally, this script is used for notification or something similar.

Hook is invoked by `git-commit`.

Usage:

- Notification by email/app about a new commit.

### 1.5. pre-rebase

The [pre-rebase](https://sentenz.github.io/backup-service/website/git-scm.com/docs/githooks#_pre_rebase) hook runs before you rebase anything and can halt the process by exiting non-zero. Use this hook to disallow rebasing any commits that have already been pushed according to the [Merging Strategies](../about/merging-strategies.md).

Hook is invoked by `git-rebase`.

Usage:

- Prevent a branch from getting rebased.

Parameters:

1. Upstream from fork.
2. Rebased branch (is not set when rebasing the current branch).

### 1.6. post-checkout

The [post-checkout](https://sentenz.github.io/backup-service/website/git-scm.com/docs/githooks#_post_checkout) hook runs after a successful `git checkout`. Use it to set up your working directory properly for your project environment. This may mean moving in large binary files that you don’t want source controlled, auto-generating documentation, or something along those lines.

Hook is invoked by `git-checkout`, `git-switch` or `git-clone`.

Usage:

- Perform repository validity checks.
- Enforce the creation of support branches from the base branches.

Parameters:

1. Ref of the previous HEAD.
2. Ref of the new HEAD.
3. Flag indicator, (changing branches, flag=1) or (retrieving a file from the index, flag=0).

### 1.7. post-rewrite

The [post-rewrite](https://sentenz.github.io/backup-service/website/git-scm.com/docs/githooks/ru.html#_post_rewrite) hook is run by commands that replace commits, such as git `commit --amend` and git rebase (though not by `git filter-branch`). Its single argument is which command triggered the rewrite, and it receives a list of rewrites on stdin. This hook has many of the same uses as the `post-checkout` and `post-merge` hooks.

Hook is invoked by `git-commit` and `git-rebase`.

Usage:

- Receives a list of the rewritten commits on stdin.

Parameters:

1. Denotes the command it was invoked by.

### 1.8. post-merge

The [post-merge](https://sentenz.github.io/backup-service/website/git-scm.com/docs/githooks#_post_merge) hook runs after a successful `merge` command, which happens when a `git pull` is done on a local repository. Use it to restore data in the working tree that Git can’t track, such as permissions data. This hook can likewise validate the presence of files external to Git control that you may want copied in when the working tree changes.

Hook is invoked by `git-merge`.

Usage:

- Use in conjunction with a corresponding pre-commit hook to save and restore any form of metadata associated with the working tree (e.g. permissions/ownership, ACL).

Parameters:

1. Status flag specifying whether or not the merge being done was a squash merge.

### 1.9. pre-push

The [pre-push](https://sentenz.github.io/backup-service/website/git-scm.com/docs/githooks#_pre_push) hook runs during `git push`, after the remote refs have been updated but before any objects have been transferred. It receives the name and location of the remote as parameters, and a list of to-be-updated refs through `stdin`. Use it to validate a set of ref updates before a push occurs (a non-zero exit code will abort the push). Further, prevent pushing to [main/develop] branch according to the [Branching Strategies](../about/branching-strategies.md).

Hook is invoked by `git-push`.

Usage:

- Prevent a push.

Parameters:

1. Name of the destination remote.
2. Location of the destination remote.

### 1.10. applypatch-msg

The [applypatch-msg](https://sentenz.github.io/backup-service/website/git-scm.com/docs/githooks#_applypatch_msg) email workflow invoked by the `git am` command takes a single argument: the name of the temporary file that contains the proposed commit message. Git aborts the patch if this script exits non-zero. Use this to make sure a commit message is properly formatted, or to normalize the message by having the script edit it in place.

### 1.11. pre-applypatch

The [pre-applypatch](https://sentenz.github.io/backup-service/website/git-scm.com/docs/githooks#_pre_applypatch) hook runs during `git am`, after the patch is applied but before a commit is made, so use it to inspect the snapshot before making the commit. You can run tests or otherwise inspect the working tree with this script. If something is missing or the tests don’t pass, exiting non-zero aborts the `git am` script without committing the patch.

### 1.12. post-applypatch

The [post-applypatch](https://sentenz.github.io/backup-service/website/git-scm.com/docs/githooks#_post_applypatch) hook runs during `git am`, which runs after the commit is made. Use it to notify a group or the author of the patch you pulled in that you’ve done so. You can’t stop the patching process with this script.

## 2. Server-Side Hooks

Server-side hooks can be used as a system administrator to enforce nearly any kind of policy for your project. These scripts run before and after pushes to the server. The pre hooks can exit non-zero at any time to reject the push as well as print an error message back to the client; you can set up a push policy that’s as complex as you wish.

> NOTE Server-side hooks can be used to enforce a policy - [Git-Enforced Policy](https://git-scm.com/book/en/v2/Customizing-Git-An-Example-Git-Enforced-Policy).

### 2.1. pre-receive

The first script to run when handling a push from a client is [pre-receive](https://sentenz.github.io/backup-service/website/git-scm.com/docs/githooks#pre-receive). It takes a list of references that are being pushed from `stdin`; if it exits non-zero, none of them are accepted. Use this hook to do things like make sure none of the updated references are non-fast-forwards, or to do access control for all the refs and files they’re modifying with the push.

Hook is invoked by `git-receive-pack`.

Usage:

- Push the code to production.

### 2.2. update

The [update](https://sentenz.github.io/backup-service/website/git-scm.com/docs/githooks#update) script is very similar to the `pre-receive` script, except that it’s run once for each branch the pusher is trying to update. If the pusher is trying to push to multiple branches, `pre-receive` runs only once, whereas update runs once per branch they’re pushing to. Instead of reading from stdin, this script takes three arguments: the name of the reference (branch), the SHA-1 that reference pointed to before the push, and the SHA-1 the user is trying to push. If the update script exits non-zero, only that reference is rejected; other references can still be updated.

Hook is invoked by `git-receive-pack`.

Usage:

- Enforce a `fast-forward only` policy.

Parameters:

1. Name of the ref being updated.
2. Old object name stored in the ref.
3. New object name to be stored in the ref.

### 2.3. post-receive

The [post-receive](https://sentenz.github.io/backup-service/website/git-scm.com/docs/githooks#post-receive) hook runs after the entire process is completed and can be used to update other services or notify users. It takes the same `stdin` data as the `pre-receive` hook. Examples include emailing a list, notifying a continuous integration server, or updating a ticket-tracking system – you can even parse the commit messages to see if any tickets need to be opened, modified, or closed. This script can’t stop the push process, but the client doesn’t disconnect until it has completed, so be careful if you try to do anything that may take a long time.

Hook is invoked by `git-receive-pack`.

Usage:

- Push the code to production.

## 3. Configuration

The hooks are all stored in the hooks subdirectory of the Git directory. In most projects, that’s `.git/hooks`, by default the hooks directory is `$GIT_DIR/hooks`. When you initialize a new repository with `git init`, Git populates the hooks directory with a bunch of example scripts, many of which are useful by themselves; but they also document the input values of each script. All the examples are written as shell scripts, with some Perl thrown in, but any properly named executable scripts will work fine – you can write them in Ruby or Python or whatever language you are familiar with. If you want to use the bundled hook scripts, you’ll have to rename them; their file names all end with `.sample`.

To enable a hook script, put a file in the `hooks` subdirectory of your .git directory that is named appropriately (without any extension) and is executable. From that point forward, it should be called. We’ll cover most of the major hook filenames here.

The `.git` folder is not under version control, since most of its contents are device and user-specific. If you’re using Git version 2.9 or greater, change the hooks directory using `core.hooksPath` configuration variable. Create a folder inside the repository and place it under version control and change the hooks directory with the following command:

```bash
git config core.hooksPath githooks
```

## 4. References

- Git [book](https://git-scm.com/book/en/v2) article.
