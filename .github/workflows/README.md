# `/.gitlab`

The `/.gitlab` directory contains GitLab configuration files and pipelines.

1. Files and Folders

    - `conventional-commits.yml`
      > A pipeline configuration file using [GitHub Action](https://github.com/amannn/action-semantic-pull-request) to enforce PR title matches the `conventional commits` specification.

    - `labeler.yml`
      > A pipeline configuration file using [GitHub Action](https://github.com/actions/labeler) to automatically apply labels to issues and pull requests based on the title and body of the issue or pull request.

    - `secret-scanning.yml`
      > A pipeline configuration file using [GitHub Action](https://github.com/marketplace/actions/trufflehog-oss) to scan the repository for secrets and credentials.

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

    - `pages.yml`
      > The configuration file is set to deploy the repository to GitHub Pages using the `gh-pages` branch. The `gh-pages` branch is created and maintained by the GitHub Actions workflow.
      >
      > NOTE Enable GitHub Pages under the repository settings and select the `gh-pages` branch as the source. GitHub Actions will automatically build and deploy the site to the `gh-pages` branch. Persmissions are required to deploy to the `gh-pages` branch. Ensure that the `actions/upload-pages-artifact` point to the `site_dir` directory from the `mkdocs.yml` configuration file.
