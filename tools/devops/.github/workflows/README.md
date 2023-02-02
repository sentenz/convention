# `/workflows`

- continuous-security.yml
  > An yaml file containing actions for continuous security pipeline, triggered by pull request (PR) events.
  >
  > The actions in the continuous security pipeline, enforce [security testing](https://sentenz.github.io/guide/internal/about/xops.html#4-devsecops) .

- continuous-integration.yml
  > An yaml file containing actions for continuous integration pipeline, triggered upon the completion of another pipeline.
  >
  > The actions in the continuous integration pipeline, performs [code analysis](https://sentenz.github.io/guide/internal/about/software-analysis.html) to the `changed` files of a support repository.

- continuous-testing.yml
  > An yaml file containing actions for continuous testing pipeline, triggered upon the completion of another pipeline.
  >
  > The actions in the continuous testing pipeline, performs [software testing](https://sentenz.github.io/guide/internal/about/software-testing.html) tasks such as `build` and `unit tests`.

- continuous-release.yml
  > An yaml file containing actions for continuous release pipeline, triggered from base branch.
  >
  > The actions in the continuous release pipeline, creates a `version tag` and a `CHANGELOG` file based on [commit messages](https://sentenz.github.io/guide/internal/guideline/commit-message-guide.html).
  >
  > NOTE Automatically populated GITHUB_TOKEN cannot be used if branch protection is enabled for the target branch. Create and provide a Personal Access Tokens (PAT) with appropriate repository permissions and replace the default `PAT_RELEASE_TOKEN` token with the new token.
