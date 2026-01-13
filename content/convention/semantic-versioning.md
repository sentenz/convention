---
title: "Semantic Versioning"
date: 2026-01-13
draft: false
description: "SemVer specification for meaningful version numbers (MAJOR.MINOR.PATCH)"
tags: ["versioning", "semver", "convention"]
---

# Semantic Versioning

Semantic Versioning ([SemVer](https://semver.org/)) is a versioning scheme for software that aims to convey meaning about the underlying code changes and their impact on compatibility.

Semantic Versioning provides a clear and structured way to communicate changes in software versions, making it easier for developers and users to understand the impact of updates on compatibility. It has gained widespread adoption in the software development community and is commonly used in open-source projects and libraries.

- [1. Category](#1-category)
- [2. Principles](#2-principles)
- [3. Best Practice](#3-best-practice)
- [4. Terminology](#4-terminology)
- [5. References](#5-references)

## 1. Category

The format of a semantic version number is represented as `MAJOR.MINOR.PATCH`.

Components of SemVer:

1. MAJOR version

    The `MAJOR` number is increased by incompatible changes in the software. It indicates that the new version may introduce breaking changes and is not backward compatible with previous versions. Users of the software may need to modify their code or configurations to work with the new version.

    - Examples: 1.0.0, 2.0.0, 3.0.0

2. MINOR version

    The "MINOR" number is increased as new features or functions are added to the software in a backward compatible manner. It indicates that the new version brings new capabilities without breaking existing functionality. Users can safely update to a higher MINOR version without worrying about compatibility issues.

    - Examples: 1.1.0, 1.2.0, 1.3.0

3. PATCH version

    The `PATCH` number is increased by backward-compatible bug fixes or patches to the software. It indicates that the new version includes only fixes for issues and does not introduce any new features. Users can update to a higher PATCH version without any concerns about compatibility.

    - Examples: 1.0.1, 1.0.2, 1.0.3

4. Pre-release version (optional)

   The `Pre-release` is an optional label that can be appended to a version to indicate it is a pre-release or development version. It is typically denoted with a hyphen, followed by a series of alphanumeric identifiers like alpha, beta, rc (release candidate), etc.

   - Examples: 1.0.0-alpha.1, 2.0.0-beta.2

5. Build metadata (optional)
  
   The `Build` is an optional label that can be added to a version to identify the specific build or revision of the software. It is typically denoted with a plus sign, followed by build metadata such as a commit hash, build number, etc.

   - Examples: 1.0.0+20130313144700, 2.3.4+sha34578

## 2. Principles

Semantic versioning (SemVer) is guided by a set of principles that help define its purpose and usage.

The principles of SemVer aim to improve version management, facilitate communication between developers and users, and enable informed decisions about software upgrades and compatibility. By adhering to these principles, software projects can effectively communicate the nature of changes and ensure compatibility across different versions.

- Backward compatibility
  > SemVer maintains a strong commitment to backward compatibility. It ensures that existing code that relies on a specific version of a software package will continue to work as expected when a new version with a higher MAJOR, MINOR, or PATCH number is released. Backward-compatible changes are introduced in MINOR and PATCH versions, while incompatible changes are reserved for a new MAJOR version.

- Clear versioning scheme
  > SemVer provides a clear and structured versioning scheme in the format of MAJOR.MINOR.PATCH. This format makes it easy to understand the nature of changes and their impact on compatibility. Each component of the version number has a specific meaning, allowing developers and users to assess the implications of updating to a new version.

- Incremental versioning
  > SemVer uses incremental version numbers. When making changes to a software package, developers increment the appropriate component of the version number based on the nature of the changes. This incrementation signals the type of changes made and helps users understand the significance of each version.

- Version precedence
  > SemVer defines a set of rules for comparing and determining the precedence of different versions. It allows users to easily identify which version is newer or older, helping in dependency management and software selection. The precedence rules take into account the MAJOR, MINOR, and PATCH components of the version number.

- Pre-release and build metadata
  > SemVer allows for the inclusion of pre-release versions and build metadata to provide additional information about a version. Pre-release versions indicate that a version is still in development or testing, while build metadata can be used to include additional information like commit hashes or build numbers. These labels help communicate the status and context of a version.

## 3. Best Practice

When working with Semantic Versioning (SemVer), there are several best practices that can help ensure clarity, consistency, and effective version management.

- Follow the SemVer specification
  > Adhere to the guidelines and rules outlined in the SemVer specification. This includes correctly incrementing version numbers based on the type of changes made and using the proper format of MAJOR.MINOR.PATCH.

- Clearly communicate breaking changes
  > When releasing a new major version (MAJOR increment), clearly document and communicate the breaking changes to users and developers. Provide release notes or a changelog that highlights the incompatibilities and necessary modifications.

- Use pre-release versions for early development
  > If a version is not yet stable or ready for production use, use pre-release identifiers (e.g., alpha, beta, rc) to indicate its development status. This helps set user expectations and makes it clear that the version may contain bugs or unfinished features.

- Update dependencies carefully
  > When specifying dependencies on other software packages, consider both the version range and the type of changes introduced in newer versions. Use version constraints (e.g., ^1.0.0, >=2.0.0) to define acceptable ranges and avoid unintentionally pulling in incompatible or breaking changes.

- Provide clear documentation
  > Maintain thorough documentation for the software package, including details on the usage, changes, and upgrade instructions. Clearly describe how different versions are compatible or incompatible, and provide guidelines for users to handle version updates.

- Automate version management
  > Utilize tools and workflows that automate version management tasks, such as version number increments, release note generation, and dependency updates. Automation reduces the chances of human error and streamlines the release process.

- Respect version precedence
  > Understand and respect the version precedence rules defined by SemVer. When comparing versions, ensure that the correct ordering is followed, especially when managing dependencies or selecting the appropriate version for the project.

- Test compatibility and perform regression testing
  > Regularly test the software package for compatibility with different versions of its dependencies. Perform regression testing to ensure that existing functionality remains intact after making changes or applying patches.

- Solicit user feedback and engage in the community
  > Encourage users and developers to provide feedback and report issues related to version updates. Engage with the community and address concerns promptly. This collaboration helps improve the quality and stability of the software package.

## 4. Terminology

Understanding the terminologies help to navigate and communicate effectively within the context of Semantic Versioning and version management in software development.

- Version
  > A specific release or iteration of a software package, identified by a version number.

- Version Number
  > A numerical representation that identifies a particular version. In SemVer, version numbers are typically in the format of MAJOR.MINOR.PATCH.

- MAJOR Version
  > The first component of a version number. It indicates incompatible changes with previous versions and signifies significant updates or overhauls to the software.

- MINOR Version
  > The second component of a version number. It represents the addition of new features or functionality in a backward-compatible manner.

- PATCH Version
  > The third component of a version number. It indicates bug fixes, patches, or security updates without introducing new features or breaking existing functionality.

- Pre-release Version
  > A version that is denoted by appending a hyphen followed by identifiers (e.g., alpha, beta, rc) and a numeric value to the version number. Pre-release versions are used to indicate that a version is still under development or testing and may not be stable or fully functional.

- Build Metadata
  > Additional information associated with a version that is denoted by appending a plus sign followed by identifiers like commit hashes or build numbers. Build metadata is optional and does not affect version precedence or compatibility.

- Backward Compatibility
  > The ability of newer versions of a software package to work seamlessly with code written for older versions, without requiring modifications.

- Changelog
  > A document or log that details the changes, additions, and fixes made in each version of a software package.

- Dependency
  > A software component or library that is required by another software package to function correctly. Dependencies often have their own versioning schemes and compatibility requirements.

- Compatibility Range
  > A range of acceptable versions that define the compatibility boundaries when specifying dependencies. It is often expressed using version constraints (e.g., ^1.0.0, >=2.0.0) to allow for flexibility while ensuring compatibility.

- Regression Testing
  > The process of retesting previously functioning features of a software package to ensure that they continue to work as expected after making changes or applying updates.

## 5. References

- Sentenz [versioning guide](../guides/versioning-guide.md) article.
- Sentnez [conventional commits](../convention/conventional-commits.md) article.
- Sentnez [changelog](../convention/changelog.md) article.
- Github [semver](https://github.com/semver/semver.org) repository.
