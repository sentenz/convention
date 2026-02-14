# Dependency Pinning

Dependency pinning is the practice of locking dependency versions to specific packages, tags, or digests. By explicitly specifying the versions of libraries a project uses, developers ensure reproducible builds, reduce the risk of unexpected breaking changes, and mitigate supply-chain security risks.

- [1. Category](#1-category)
  - [1.1. Versioning Specifiers](#11-versioning-specifiers)
    - [1.1.1. Label Tags](#111-label-tags)
    - [1.1.2. Version Tags and Ranges](#112-version-tags-and-ranges)
      - [1.1.2.1. Version Tags](#1121-version-tags)
      - [1.1.2.2. Version Ranges](#1122-version-ranges)
    - [1.1.3. Transitive Dependencies](#113-transitive-dependencies)
    - [1.1.4. Hash Digest](#114-hash-digest)
  - [1.2. Versioning Syntax](#12-versioning-syntax)
  - [1.3. Versioning Strategies](#13-versioning-strategies)
- [2. References](#2-references)

## 1. Category

### 1.1. Versioning Specifiers

Version specifiers use a combination of symbols and operators to define an acceptable range of package versions, based on the Major.Minor.Patch (X.Y.Z) format of Semantic Versioning.

#### 1.1.1. Label Tags

Label tags (`latest`, `stable`, `main`) are mutable symbolic pointers to an underlying version or commit to specify dependencies. Labels may be reassigned to different versions or commits over time, making them inherently unreliable for ensuring build reproducibility and posing significant risks to security and stability.

1. Concepts and Components

    - Mutable Tags
      > [!NOTE]
      > Label tags are symbolic references that can be reassigned to different commits or versions over time, making them unreliable for consistent builds. This mutability allows dependencies to change unexpectedly, potentially introducing bugs, vulnerabilities, or breaking changes without notice.

2. Features and Benefits

    - Simplicity
      > Label tags are easy to use and understand, making them accessible for developers who may not be familiar with versioning concepts.

    - Flexibility
      > They allow developers to always use the most recent version of a dependency without needing to update version numbers manually.

    - Risk
      > Using label tags can lead to unpredictable builds, as the underlying version may change without warning. This can introduce bugs, vulnerabilities, or breaking changes into a project.

3. Examples and Explanations

    - `latest`
      > Refers to the most recent stable release of a package, which can change frequently.

    - `stable`
      > Refers to a release that is considered stable and ready for production use, but the exact commit it points to can change.

    - `main`
      > Refers to the main development branch, which is frequently updated and may contain unstable or experimental code.

#### 1.1.2. Version Tags and Ranges

##### 1.1.2.1. Version Tags

Version tags specify an exact version of a dependency, ensuring that the same version is used every time the project is built. This method reduces the risk of unexpected changes but still relies on the integrity of the package source.

1. Concepts and Components

    - Semantic Versioning (SemVer)
      > A versioning scheme that uses `MAJOR.MINOR.PATCH` increments to convey the nature of changes in a release.

    - Mutable Tags
      > [!NOTE]
      > Version tags are generally intended to be immutable identifiers for specific releases, but they can be overwritten (e.g., via Git force-push), allowing the underlying code to change without updating the tag name. This risks introducing vulnerabilities or breaking changes into builds that pin to the tag, unlike hash-based pinning which ensures true immutability. Stronger integrity is achieved by combining version tags with lockfiles, signed releases, cryptographic checksums/digests, or pin to an exact commit or artifact digest.

2. Features and Benefits

    - Reproducible Builds
      > Pinning to a specific version tag ensures that the same code is used every time, leading to consistent and reliable builds.

    - Stability
      > Using version tags helps avoid unexpected breaking changes that can occur with mutable tags.

    - Security
      > By specifying exact versions, developers can avoid inadvertently pulling in versions with known vulnerabilities.

    - Risk
      > Since version tags can be overwritten, there is a risk that the code associated with a tag may change, potentially introducing vulnerabilities or breaking changes.

3. Examples and Explanations

    - `1.2.3`
      > Specifies exactly version `1.2.3` of a dependency.

      ```json
      {
        "dependencies": {
          "example-dependency": "1.2.3"
        }
      }
      ```

##### 1.1.2.2. Version Ranges

Version ranges allow developers to specify a set of acceptable versions for a dependency. This provides flexibility to receive minor updates and patches while avoiding major version changes that could introduce breaking changes. However, it still relies on the integrity of the package source.

1. Concepts and Components

    - Caret (`^`), Tilde (`~`), Inequalities
      > Common syntaxes used to define version ranges in package managers.

    - Mutable Tags
      > [!NOTE]
      > Version ranges allow automatic updates within the specified bounds (e.g., minor or patch versions), making the resolved dependency inherently mutable over time. Builds performed at different times can resolve to different concrete versions (depending on registry state and transitive updates), which reduces reproducibility and may silently introduce vulnerabilities or regressions.

2. Features and Benefits

    - Flexibility
      > Version ranges allow projects to automatically receive non-breaking updates, such as bug fixes and new features, without manual intervention.

    - Reduced Maintenance
      > Developers do not need to frequently update dependency versions, as the package manager will handle updates within the specified range.

    - Risk
      > Because version ranges can resolve to different versions over time, they may introduce unexpected bugs, vulnerabilities, or breaking changes if not carefully managed.

3. Examples and Explanations

    - `~1.2.3`
      > Allows patch-level changes if a minor version is specified on the comparator. Allows minor-level changes if not.

    - `>=1.2.3`
      > Allows any version greater than or equal to `1.2.3`.

    - `^1.2.3`
      > Allows changes that do not modify the left-most non-zero digit in the version.

      ```json
      {
        "dependencies": {
          "example-dependency": "^1.2.3"
        }
      }
      ```

#### 1.1.3. Transitive Dependencies

Transitive dependencies are dependencies of dependencies. Pinning transitive dependencies can help ensure that a project remains stable and secure, as changes in these dependencies can introduce bugs or vulnerabilities.

1. Concepts and Components

    - Lockfiles
      > Files that record the exact versions of dependencies and transitive dependencies used in a project. Lockfiles ensure reproducible builds by locking down the entire dependency tree.

    - Immutable
      > Pinning transitive dependencies records the fully resolved dependency graph for consistency across builds. Stronger integrity is achieved by combining lockfiles with cryptographic digests.

2. Features and Benefits

    - Dependency Drift
      > Pinning transitive dependencies prevent dependency drift, where indirect dependencies change unexpectedly, potentially causing build failures or introducing vulnerabilities.

    - Reproducible Builds
      > Lockfiles ensure that all developers and CI systems use the same versions of dependencies, leading to consistent and reliable builds.

    - Security
      > By locking transitive dependencies, projects can avoid inadvertently pulling in versions with known vulnerabilities.

    - Maintenance
      > Lockfiles can be updated periodically to incorporate security patches and bug fixes in a controlled manner.

3. Examples and Explanations

    - `package-lock.json`
      > A lockfile used by npm to pin the exact versions of dependencies and transitive dependencies.

      ```json
      {
        "name": "example-project",
        "version": "1.0.0",
        "lockfileVersion": 2,
        "dependencies": {
          "example-dependency": {
            "version": "2.3.4",
            "resolved": "https://registry.npmjs.org/example-dependency/-/example-dependency-2.3.4.tgz",
            "integrity": "sha512-abc123..."
          }
        }
      }
      ```

#### 1.1.4. Hash Digest

Hash digest pinning is the most secure method of dependency management. It identifies a dependency by the cryptographic hash of its contents rather than a version number or label. This ensures that the code being used is bit-for-bit identical to what was expected, effectively neutralizing risks associated with tag overwrites or compromised registries.

1. Concepts and Components

    - Cryptographic Hash Functions (SHA-256)
      > Algorithms that produce a fixed-size hash value from input data, ensuring data integrity and authenticity.

      > [!NOTE]
      > Although accidental and intentional hash collisions are theoretically possible, the probability is negligible with modern algorithms like SHA-256.

    - Immutable
      > The hash digest identifies the exact bytes of the artifact to provides immutability of the referenced package contents, ensuring reproducible builds and strong integrity checks.

2. Features and Benefits

    - Data Integrity
      > Hash digests ensure that the content of a dependency has not been altered, providing strong guarantees against tampering or corruption.

    - Reproducible Builds
      > Pinning dependencies by hash digest guarantees that the exact same code is used every time, leading to consistent and reliable builds.

    - Security
      > Using hash digests mitigates risks associated with compromised package registries or overwritten tags, as the hash will not match if the content has changed.

    - Maintenance
      > While hash digest pinning provides strong security, it may require more effort to update dependencies, as developers must obtain the new hash for each update.

3. Examples and Explanations

    - Lockfile Entry
      > A SHA-256 hash digest that uniquely identifies the exact content of a dependency package.

      ```plaintext
      example-dependency@1.2.3 sha256:94a0b1c2d3e4f567890abcdef1234567890abcdef1234567890abcdef123456ea1a
      ```

    - Dockerfile
      > Container file defining a immutable base image using specific image digest.

      ```Dockerfile
      FROM ubuntu@sha256:94a0b1c2d3e4f567890abcdef1234567890abcdef1234567890abcdef123456ea1a
      ```

### 1.2. Versioning Syntax

Versioning syntax expresses the rules for specifying acceptable versions of dependencies using symbols and operators.

1. Symbols

    Versioning symbols provide shorthand notations to define version ranges based on Semantic Versioning principles.

    | Symbol | Example | Name     | Defined Range         | Practice                                                                                                    |
    | ------ | ------- | -------- | --------------------- | ----------------------------------------------------------------------------------------------------------- |
    | ^      | ^1.2.3  | Caret    | \ge 1.2.3 and < 2.0.0 | Allow minor and patch updates (new features and bug fixes) while avoiding major breaking changes.           |
    | ~      | ~1.2.3  | Tilde    | \ge 1.2.3 and < 1.3.0 | Allow only patch updates (bug fixes) while strictly locking features to a specific minor version.           |
    | *      | 1.2.*   | Wildcard | \ge 1.2.0 and < 1.3.0 | Matches any number in the specified position. Typically used like the tilde to allow patch updates (1.2.*). |
    | None   | 1.2.3   | Exact    | = 1.2.3               | Locks the package to a single, specific version.                                                            |

2. Operators

    Versioning operators provide precise control over acceptable versions by defining inequalities and ranges.

    | Operator | Example        | Name                     | Meaning                                          | Practice                                                   |
    | -------- | -------------- | ------------------------ | ------------------------------------------------ | ---------------------------------------------------------- |
    | >        | >1.2.3         | Greater Than             | Must be strictly later than 1.2.3.               | Used to set a minimum floor, often without an upper limit. |
    | <        | <2.0.0         | Less Than                | Must be strictly earlier than 2.0.0.             | Used to set an upper ceiling, preventing major updates.    |
    | >=       | >=1.2.3        | Greater Than or Equal To | Must be 1.2.3 or any later version.              | Common way to define a starting point for an open range.   |
    | <=       | <=1.2.3        | Less Than or Equal To    | Must be 1.2.3 or any earlier version.            | Locks to a specific version or older.                      |
    | =        | =1.2.3         | Equal To                 | Must be exactly 1.2.3.                           | Same as using no symbol (the Exact match).                 |
    | >/<      | >=1.2.3 <1.5.0 | Comparison               | Between 1.2.3 (inclusive) and 1.5.0 (exclusive). | Used to define precise version ranges.                     |
    | -        | 1.2.3 - 2.0.0  | Hyphen                   | Between 1.2.3 and 2.0.0, inclusive.              | Simplified syntax for defining inclusive ranges.           |

### 1.3. Versioning Strategies

Versioning strategies combine different pinning methods to balance reproducibility, security, and flexibility.

| Strategy                             | Syntax                                      | Reproducibility                         | Security  | Practice                          |
| :----------------------------------- | :------------------------------------------ | :-------------------------------------- | :-------- | :-------------------------------- |
| Exact pinning + lockfile + hashes    | `package==1.2.3` + lockfile with SHA256     | 100% (Immutable)                        | Highest   | Production, CI, releases          |
| Git / URL pinning                    | `git+https://...#commit=abc123`             | 100% (Immutable, unless repo deleted)   | Highest   | Critical deps, security           |
| Exact pinning + lockfile (no hashes) | `package==1.2.3` + `conan.lock`/`yarn.lock` | High (Registry dependent)               | Very High | Most real-world projects          |
| Exact pinning only (no lockfile)     | `package==1.2.3` in `requirements.txt`      | Medium (Transitive drift risk)          | Medium    | Small scripts                     |
| Pessimistic tilde                    | `~=1.2.3` → ≥1.2.3, <1.3.0                  | Low (Allows patch updates)              | Medium    | Python (Poetry default)           |
| Tilde (`~`)                          | `~1.2.3` → ≥1.2.3, <1.3.0                   | Low (Allows patch updates)              | Medium    | Recommended for minor flexibility |
| Caret (`^`)                          | `^1.2.3` → ≥1.2.3, <2.0.0                   | Very Low (Allows minor & patch updates) | Low       | Risky for reproducibility         |
| Loose inequalities                   | `>=1.2.3` or `*`                            | None (Unpredictable)                    | Lowest    | Dev only, never commit            |

## 2. References

- arXiv [Dependency Pinning](https://arxiv.org/html/2502.06662v1) page.
- Renovate [Dependency Pinning](https://docs.renovatebot.com/dependency-pinning/) page.
- Sentenz [Versioning](../articles/versioning.md) article.
- Sentenz [Dependency Manager](../articles/dependency-manager.md) article.
