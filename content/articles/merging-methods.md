# Merge Methods

Merge methods refer to the specific procedures or commands used to perform the integration of changes in Git. They determine the actual merge process and the resulting structure of the commit history.

- [1. Category](#1-category)
  - [1.1. Implicit Merging](#11-implicit-merging)
    - [1.1.1. Fast-Forward Merge](#111-fast-forward-merge)
    - [1.1.2. Squash Merge](#112-squash-merge)
    - [1.1.3. Rebase Merge](#113-rebase-merge)
  - [1.2. Explicit Merging](#12-explicit-merging)
    - [1.2.1. Merge Commit](#121-merge-commit)
    - [1.2.2. Semi-Linear Merge](#122-semi-linear-merge)
- [2. Terminology](#2-terminology)
- [3. References](#3-references)

## 1. Category

### 1.1. Implicit Merging

Implicit merging incorporates changes from one branch into another in a straightforward, sequential manner that typically preserves a `linear history`.

#### 1.1.1. Fast-Forward Merge

Moves the branch pointer forward without creating a new commit if possible.

1. Commands and Operations

    ```bash
    git checkout main
    git merge --ff feature
    ```

2. Representations and Diagrams

    - Before Merge

      ```mermaid
      gitGraph
        commit id: "A"
        branch feature
        checkout feature
        commit id: "B"
        checkout main
        commit id: "C"
        checkout feature
        commit id: "D"
        checkout main
        commit id: "E"
        checkout feature
        commit id: "F"
      ```

    - After Merge

      ```mermaid
      gitGraph
        commit id: "A"
        commit id: "B"
        commit id: "C"
        commit id: "D"
        commit id: "E"
        commit id: "F"
      ```

#### 1.1.2. Squash Merge

Combines all changes from a feature branch into a single commit before merging, maintaining a cleaner commit history.

1. Commands and Operations

    ```bash
    git checkout main
    git merge --squash feature
    git commit -m "feat: create API rate limits using RPM (requests per minute)"
    ```

2. Representations and Diagrams

    - Before Merge

      ```mermaid
      gitGraph
        commit id: "A" type: HIGHLIGHT
        branch feature
        checkout feature
        commit id: "B"
        checkout main
        commit id: "C" type: HIGHLIGHT
        checkout feature
        commit id: "D"
        checkout main
        commit id: "E" type: HIGHLIGHT
        checkout feature
        commit id: "F"
      ```

    - After Merge

      ```mermaid
      gitGraph
        commit id: "A" type: HIGHLIGHT
        commit id: "C" type: HIGHLIGHT
        commit id: "E" type: HIGHLIGHT
        commit id: "G" type: HIGHLIGHT
      ```

#### 1.1.3. Rebase Merge

Incorporates changes by rewriting the commit history of the feature branch and then fast-forward merging into the target branch.

1. Commands and Operations

    ```bash
    git checkout feature
    git rebase main
    git checkout main
    git merge --ff-only feature
    ```

2. Representations and Diagrams

    - Before Merge

      ```mermaid
      gitGraph
        commit id: "A"
        branch feature
        checkout feature
        commit id: "B"
        checkout main
        commit id: "C"
        checkout feature
        commit id: "D"
        checkout main
        commit id: "E"
        checkout feature
        commit id: "F"
      ```

    - After Merge

      ```mermaid
      gitGraph
        commit id: "A"
        commit id: "C"
        commit id: "E"
        commit id: "B'"
        commit id: "D'"
        commit id: "F'"
      ```

### 1.2. Explicit Merging

Explicit merging integrates changes by intentionally creating a merge commit, which keeps branch topology visible and results in a `non-linear history`.

#### 1.2.1. Merge Commit

  Creates a dedicated merge commit that records the integration point of two branches.

1. Commands and Operations

    ```bash
    git checkout main
    git merge --no-ff feature
    ```

2. Representations and Diagrams

    - Before Merge

      ```mermaid
      gitGraph
        commit id: "A"
        branch feature
        checkout feature
        commit id: "B"
        checkout main
        commit id: "C"
        checkout feature
        commit id: "D"
        checkout main
        commit id: "E"
        checkout feature
        commit id: "F"
      ```

    - After Merge

      ```mermaid
      gitGraph
        commit id: "A"
        branch feature
        checkout feature
        commit id: "B"
        checkout main
        commit id: "C"
        checkout feature
        commit id: "D"
        checkout main
        commit id: "E"
        checkout feature
        commit id: "F"
        checkout main
        merge feature id: "G"
        checkout main
      ```

#### 1.2.2. Semi-Linear Merge

A semi-linear merge combines a rebase and a merge commit. The feature branch is rebased on top of the target branch first.

1. Commands and Operations

    ```bash
    git checkout feature
    git rebase main
    git checkout main
    git merge --no-ff feature
    ```

2. Representations and Diagrams

    - Before Merge

      ```mermaid
      gitGraph
        commit id: "A"
        branch feature
        checkout feature
        commit id: "B"
        checkout main
        commit id: "C"
        checkout feature
        commit id: "D"
        checkout main
        commit id: "E"
        checkout feature
        commit id: "F"
      ```

    - After Merge

      ```mermaid
      gitGraph
        commit id: "A"
        commit id: "C"
        commit id: "E"
        branch feature
        checkout feature
        commit id: "B"
        commit id: "D"
        commit id: "F"
        checkout main
        merge feature id: "G"
        checkout main
      ```

## 2. Terminology

- Fast-Forward Merge
  > A merge strategy where the branch pointer is moved forward without creating a new commit if possible.

- Three-Way Merge
  > A merge operation that uses two branch tips and their common ancestor to produce a new merged result.

- Squash Merge
  > A merge method that combines all changes from a feature branch into a single commit before integrating into the target branch.

- Rebase and Merge
  > A merge method that rebases branch commits onto the latest target branch and then performs a fast-forward merge.

- Implicit Merge
  > Merging that results in a linear commit history without introducing a merge commit.

- Explicit Merge
  > Merging that intentionally creates a merge commit to preserve branch ancestry.

- Conflict Resolution
  > The process of resolving conflicts that arise during a merge when changes in different branches cannot be automatically reconciled.

- Merge Commit
  > A commit created during a merge operation that combines changes from multiple branches.

- Semi-Linear Merge
  > A workflow where changes are rebased onto the target branch and still merged with a merge commit (`--no-ff`).

- No-Fast-Forward Merge
  > A merge method that always creates a merge commit, even when a fast-forward is possible.

- Branch Divergence
  > The state where branches have developed independently, requiring a merge or rebase for integration.

## 3. References

- Git [merge strategies](https://git-scm.com/docs/merge-strategies) page.
- GitHub [merge methods](https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/configuring-pull-request-merges/about-merge-methods-on-github) page.
- Atlassian [merge strategy](https://www.atlassian.com/git/tutorials/using-branches/merge-strategy) page.
- W3docs [merge strategies](https://www.w3docs.com/learn-git/git-merge-strategies.html) page.
- Microsoft [pull requests with rebase](https://devblogs.microsoft.com/devops/pull-requests-with-rebase/) page.
