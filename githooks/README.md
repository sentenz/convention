# `/githooks`

Git hooks provides the ability to trigger custom scripts when certain git actions occur.

- [Configuration](#configuration)
- [Hooks](#hooks)

## Configuration

The `.git` folder is not under version control, since most of its contents are device and user-specific. For git version 2.9 or higher, change the hooks directory using `core.hooksPath` configuration variable.

Create a folder inside the repository and place it under version control. Change the hooks directory path with the following command:

```bash
git config core.hooksPath path/to/githooks
```

Make the hooks executable using the following command:

```bash
chmod +x path/to/githooks/*
```

## Hooks

- pre-commit
  > Contained actions:
  >
  > - Enforce coding standards and static analysis os the codebase through linting, spell checks, and code style checks.

- commit-msg
  > Contained actions:
  > 
  > - Enforce the conventional commits specification to commit messages.

- pre-push
  > Contained actions:
  > 
  > - Enforce the branching strategy to prevent direct pushes to base branches.
  > - Enforce the branching strategy of the naming convention for support branches.

- post-checkout
  > Contained actions:
  > 
  > - Enforce to create the support branches from the base branches.
