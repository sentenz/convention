# Code Review Guide

The code review guide contains suggestions on how to conduct code reviews effectively.

- [1. Code Review](#1-code-review)
  - [1.1. Look For](#11-look-for)
  - [1.2. Principles](#12-principles)
  - [1.3. Speed](#13-speed)
- [2. Pull Request](#2-pull-request)
  - [2.1. Description](#21-description)
  - [2.2. Size](#22-size)
  - [2.3. Reviewer](#23-reviewer)
- [3. Code Owners](#3-code-owners)
- [4. References](#4-references)

This guide is inspired by:

- Google [code review](https://google.github.io/eng-practices/review/) guide.
- SAP [code review](https://github.com/SAP/styleguides/releases/download/latest/abap-code-review-guide.pdf) guide.

## 1. Code Review

The primary purpose of code review is to ensure that the overall code health of the codebase is improving over time.  Code Review is a measure to ensure software quality through the exchange of knowledge, experience and opinions on complex topics such as data protection, privacy, security, concurrency, accessibility, internationalization, etc.

### 1.1. [Look For](https://google.github.io/eng-practices/review/reviewer/looking-for.html)

- Design
  > Is the code well-designed for appropriate system?

- Functionality
  > Does the code behave as the author likely intended? Is the way the code behaves good for its users?

- Complexity
  > Could the code be made simpler? Would another developer be able to easily understand and use this code when they come across it in the future? A particular type of complexity is over-engineering, where developers have made the code more generic than it needs to be, or added functionality that isn’t presently needed by the system.

- Tests
  > Does the code have correct and well-designed automated tests? Make sure that the tests in the PR are correct, sensible, and useful. Tests do not test themselves, and we rarely write tests for our tests. A human must ensure that tests are valid.

- Naming
  > Did the developer choose clear names for variables, classes, methods, etc.?

- Comments
  > Are the comments clear and useful? Usually comments are useful when they explain why some code exists, like the reasoning behind a decision, and should not be explaining what some code is doing. However, regular expressions and complex algorithms often benefit greatly from comments that explain what they’re doing.

- Style
  > Does the code follow our [style guides](http://google.github.io/styleguide/)? Prefix comments with `NIT` (nitpicking), if some style point isn’t in the style guide and would improve the code but isn’t mandatory.

- Consistency
  > The [style guides](http://google.github.io/styleguide/) is the absolute authority: if something is required by the style guide, the PR should follow the guidelines. Bias towards following the style guide unless the local inconsistency would be too confusing.

- Documentation
  > Did the developer also update relevant documentation? If documentation is missing, ask for it.

### 1.2. [Principles](https://google.github.io/eng-practices/review/reviewer/standard.html#principles)

- **In general, reviewers should favor approving a PR once it is in a state where it definitely improves the overall code health of the system being worked on, even if the PR isn't perfect.**

- Technical facts and data overrule opinions and personal preferences.

- On matters of style, the [style guide](http://google.github.io/styleguide/) is the absolute authority. Any purely style point (whitespace, etc.) that is not in the style guide is a matter of personal preference. The style should be consistent with what is there. If there is no previous style, accept the author's.

- **Aspects of software design are almost never a pure style issue or just a personal preference.** They are based on underlying principles and should be weighed on those principles, not simply by personal opinion. Sometimes there are a few valid options. If the author can demonstrate (either through data or based on solid engineering principles) that several approaches are equally valid, then the reviewer should accept the preference of the author. Otherwise the choice is dictated by standard principles of software design.

- If no other rule applies, then the reviewer may ask the author to be consistent with what is in the current codebase, as long as that doesn't worsen the overall code health of the system.

### 1.3. [Speed](https://google.github.io/eng-practices/review/reviewer/speed.html)

**Optimize for the speed at which a team of developers can produce a product.**

Unless the reviewer is in the middle of a focused task, a code review should be performed shortly after the request is received. A business day is the maximum amount of time required to respond to a code review request (i.e., first thing the next morning).

If the reviewer is in the middle of a focused task, such as writing code, do not interrupt the task to perform a code review. Research has shown that it can take a long time for a developer to get back into a smooth flow of development after being interrupted. So interrupting the task while coding is actually more expensive to the team than making another developer wait a bit for a code review. Instead, wait for a break in the task before responding to a request for review. This could be when a current coding task is completed, after lunch, returning from a meeting, coming back from the breakroom, etc.

## 2. Pull Request

Git-based platforms provide features such as Gerrit `Change`, GitHub `Pull Request (PR)` and Google `Changelist (CL)` that support the submission of changes to version control.

### 2.1. [Description](https://google.github.io/eng-practices/review/developer/cl-descriptions.html)

Follow the [merge commit message](../guideline/commit-message-guide.md#2-merge-commit-message) guide to create a PR description.

Read the examples below to get a sense of bad and good PR descriptions. In summary:

- The first line should be short, focused, and stand alone, and the PR description body should include informative details that help reviewers and future code searchers understand each PR’s effect.
- Review the description before submitting the PR.

1. Examples of bad descriptions.

    Descriptions like `fix bug` are an inadequate PR description. What bug? What did the author to fix it? Other similarly bad descriptions, that don't provide enough useful information:

    - fix: fix build
    - fix: add patch
    - refactor: moving code from A to B
    - feat: phase 1
    - feat: add convenience functions
    - refactor: kill weird URLs

2. Examples of good descriptions.

   - Description of a functionality change:
      > perf(rpc): remove size limit on RPC server message freelist (#1123)
      >
      > Servers like FizzBuzz have very large messages and would benefit from reuse. Make the freelist larger, and add a goroutine that frees the freelist entries slowly over time, so that idle servers eventually release all freelist entries.
      >
      > Closes #5813

      The first few words describe what the PR actually does. The rest of the description talks about the problem being solved, why this is a good solution, and a bit more information about the specific implementation.

   - Description of a code refactoring:
      > refactor: construct a Task with a TimeKeeper to use its TimeStr and Now methods (#1123)
      >
      > Add a Now method to Task, so the borglet() getter method can be removed (which was only used by OOMCandidate to call borglet’s Now method). This replaces the methods on Borglet that delegate to a TimeKeeper.
      >
      > Allowing Tasks to supply Now is a step toward eliminating the dependency on Borglet. Eventually, collaborators that depend on getting Now from the Task should be changed to use a TimeKeeper directly, but this has been an accommodation to refactoring in small steps.
      >
      > Continuing the long-range goal of refactoring the Borglet Hierarchy.
      >
      > Closes #2134
      > Related #5813

      The first line describes what the PR does and how this is a change from the past. The rest of the description talks about the specific implementation, the context of the PR, that the solution isn’t ideal, and possible future direction. It also explains why this change is being made.

   - Description of a new feature:
      > feat: create a Python3 build rule for `status.py` (#1123)
      >
      > This allows consumers who are already using this as in Python3 to depend on a rule that is next to the original status build rule instead of somewhere in their own tree. It encourages new consumers to use Python3 if they can, instead of Python2, and significantly simplifies some automated build file refactoring tools being worked on currently.
      >
      > Closes #5813

      The first sentence describes what’s actually being done. The rest of the description explains why the change is being made and gives the reviewer a lot of context.

### 2.2. [Size](https://google.github.io/eng-practices/review/developer/small-cls.html)

In general, the right size for a PR is **one self-contained change**.

Small PRs are:

- Reviewed more quickly.
  > It's easier for a reviewer to find five minutes several times to review small PRs than to set aside a 30 minute block to review one large PR.

- Reviewed more thoroughly.
  > With large changes, reviewers and authors tend to get frustrated by large volumes of detailed commentary shifting back and forth—sometimes to the point where important points get missed or dropped.

- Less likely to introduce bugs.
  > Since you're making fewer changes, it's easier for you and your reviewer to reason effectively about the impact of the PR and see if a bug has been introduced.

- Less wasted work if they are rejected.
  > If you write a huge PR and then your reviewer says that the overall direction is wrong, you've wasted a lot of work.

- Easier to merge.
  > Working on a large PR takes a long time, so you will have lots of conflicts when you merge, and you will have to merge frequently.

- Easier to design well.
  > It's a lot easier to polish the design and code health of a small change than it is to refine all the details of a large change.

- Less blocking on reviews.
  > Sending self-contained portions of your overall change allows you to continue coding while you wait for your current PR in review.

- Simpler to roll back.
  > A large PR will more likely touch files that get updated between the initial PR submission and a rollback PR, complicating the rollback (the intermediate PRs will probably need to be rolled back too).

NOTE **Reviewers have discretion to reject your change outright for the sole reason of it being too large.** Usually they will request to split it into a series of smaller changes. It's easier to just write small PRs in the first place.

### 2.3. Reviewer

- Draft Pull Request
  > Create a pull request draft and add a reviewer in the early stages of feature development.

- Pull Request by [Feature Flags](../about/feature-flags.md)
  > Add a feature to the base branch using feature flags.

- Random Pull Request Reviews
  > Add a reviewer at random. This creates an optimal distribution for the exchange of knowledge, experience and opinions.

- Code Owners
  > A advanced concepts to select reviewers. Use a CODEOWNERS file to define individuals or teams that are responsible for code in a repository.

## 3. Code Owners

Define individuals as [code owners](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/about-code-owners) or teams that are responsible for code in a repository. People with admin or owner permissions can set up a CODEOWNERS file in a repository.

Code owners are automatically requested for review when someone opens a pull request that modifies code that they own. Code owners are not automatically requested to review draft pull requests. When you mark a draft pull request as ready for review, code owners are automatically notified. If you convert a pull request to a draft, people who are already subscribed to notifications are not automatically unsubscribed.

When someone with admin or owner permissions has enabled required reviews, they also can optionally require approval from a code owner before the author can merge a pull request in the repository. Repository owners can add branch protection rules to ensure that changed code is reviewed by the owners of the changed files.

To use a CODEOWNERS file, create a new file called CODEOWNERS in the `root`, `docs/`, or `.github/` directory of the repository, in the base branch of the pull request. CODEOWNERS files must be under 3 MB in size. If any line in your CODEOWNERS file contains invalid syntax, that line will be skipped. When you navigate to the CODEOWNERS file in your repository on GitHub.com, you can see any errors highlighted.

Example of a CODEOWNERS file:

```txt
# This is a comment.
# Each line is a file pattern followed by one or more owners.

# These owners will be the default owners for everything in
# the repo. Unless a later match takes precedence,
# @global-owner1 and @global-owner2 will be requested for
# review when someone opens a pull request.
*       @global-owner1 @global-owner2

# Order is important; the last matching pattern takes the most
# precedence. When someone opens a pull request that only
# modifies JS files, only @js-owner and not the global
# owner(s) will be requested for a review.
*.js    @js-owner

# You can also use email addresses if you prefer. They'll be
# used to look up users just like we do for commit author
# emails.
*.go docs@example.com

# Teams can be specified as code owners as well. Teams should
# be identified in the format @org/team-name. Teams must have
# explicit write access to the repository. In this example,
# the octocats team in the octo-org organization owns all .txt files.
*.txt @octo-org/octocats

# In this example, @doctocat owns any files in the build/logs
# directory at the root of the repository and any of its
# subdirectories.
/build/logs/ @doctocat

# The `docs/*` pattern will match files like
# `docs/getting-started.md` but not further nested files like
# `docs/build-app/troubleshooting.md`.
docs/*  docs@example.com

# In this example, @octocat owns any file in an apps directory
# anywhere in your repository.
apps/ @octocat

# In this example, @doctocat owns any file in the `/docs`
# directory in the root of your repository and any of its
# subdirectories.
/docs/ @doctocat

# In this example, any change inside the `/scripts` directory
# will require approval from @doctocat or @octocat.
/scripts/ @doctocat @octocat

# In this example, @octocat owns any file in the `/apps`
# directory in the root of your repository except for the `/apps/github`
# subdirectory, as its owners are left empty.
/apps/ @octocat
/apps/github
```

There are some syntax rules for gitignore files that do not work in CODEOWNERS files:

- Escaping a pattern starting with `#` using `\` so it is treated as a pattern and not a comment
- Using `!` to negate a pattern
- Using `[ ]` to define a character range

## 4. References

- Google [code review](https://static.googleusercontent.com/media/sre.google/de//static/pdf/building_secure_and_reliable_systems.pdf#page=343&zoom=100,0,380) book.
- Google [culture of review](https://static.googleusercontent.com/media/sre.google/de//static/pdf/building_secure_and_reliable_systems.pdf#page=510&zoom=100,0,264) book.
- Google [modern code review](https://sback.it/publications/icse2018seip.pdf) article.
