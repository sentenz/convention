# `/.gitlab`

The `/.gitlab` directory contains GitLab configuration files and pipelines.

1. Files and Folders

    - `conventional-commits.yml`
      > A pipeline configuration file using GitHub Action to enforce PR title matches the `conventional commits` specification.

    - `semantic-release.yml`
      > A pipeline configuration file to streamline continuous `Semantic Release` versioning tasks. The tasks in the release pipeline are triggered by the `base` branches, and creates a version `tag` and a `CHANGELOG.md` file.
      >
      > - `Commit`:
      > Adhere to and enforce to `conventional commits` convention for commit messages.
      >
      > - `Versioning`:
      > Adhere to `semantic versioning` convention based on the commit messages in `conventional commits` format.
      >
      > - `Changelog`:
      > Adhere to `keeping a changelog` convention for tracking changes in releases.
      >
      > NOTE GitHub authentication configuration is **required** and can be set via environment variables. Create a fine-grained personal access token (PAT) `GH_TOKEN` or `GITHUB_TOKEN` in `Settings / Developer Settings` with the `repository permissions` read and write access to `code`, `issues`, and `pull requests`.
