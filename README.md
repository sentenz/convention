# Convention

General articles, conventions and guides for software development.

- [1. Details](#1-details)
- [2. Usage](#2-usage)
  - [2.1. Authentication](#21-authentication)
  - [2.2. Task Runner](#22-task-runner)
  - [2.3. Documentation](#23-documentation)
- [3. References](#3-references)

## 1. Details

This repository contains technical documentation, articles, conventions, and guides for software development. The documentation is automatically built and published to GitHub Pages using HonKit, a maintained fork of GitBook.

## 2. Usage

### 2.1. Authentication

1. SSH Authentication

    The Secure Shell (SSH) protocol provides a secure channel over an unsecured network in a client-server architecture. SSH authentication is used to verify the identity of the client and server. The SSH protocol supports various authentication methods such as password-based, public key-based, and host-based authentication.

     - Private Key
       > Private Key must be kept secret and secure on the local machine. The `~/.ssh/config` file is a user-specific configuration file for SSH (Secure Shell) clients. The `IdentityFile` keyword specifies the private key file to use for that specific connection. An SSH connection to a server can be made by issuing the command `ssh github` which corresponds to a host entry in the `~/.ssh/config` file.

       ```plaintext
       Host github
         HostName github.example.com
         User exampleuser
         IdentityFile ~/.ssh/github
       ```

     - Public Key
       > An SSH public key is part of a key pair. Share the public key, e.g. `~/.ssh/github.pub` within the GitHub account in `Settings > SSH and GPG keys` by configuring `New SSH key` or `Add SSH key`.

### 2.2. Task Runner

1. Tasks

    - [Makefile](Makefile)
      > The `Makefile` is a central task file that contains a collection of commands and operations used in the project. The `make` command is used to execute the tasks defined in the `Makefile`. The `make help` command lists the tasks used for the project.

      ```plaintext
      $ make help

      TASK
        A centralized collection of commands and operations used in this project.

      USAGE
              make [target]
      
      TARGET
              setup                        Setup the Software Development environment
      ```

### 2.3. Documentation

The project documentation is built using HonKit and automatically published to GitHub Pages.

1. Local Development

    Build and serve the documentation locally:

    ```bash
    # Install dependencies
    make setup-pages

    # Build documentation
    make pages

    # Serve locally with live reload
    npx honkit serve
    ```

    The documentation will be available at `http://localhost:4000`.

2. GitHub Pages Deployment

    The documentation is automatically built and deployed to GitHub Pages when changes are pushed to the `main` branch. The workflow:

    - Generates navigation from markdown files in `content/articles/`, `content/guides/`, and `content/convention/`
    - Builds static HTML using HonKit (GitBook-compatible SSG)
    - Deploys to GitHub Pages

    To enable GitHub Pages for this repository:
    1. Go to repository Settings > Pages
    2. Under "Build and deployment", select "GitHub Actions" as the source
    3. The site will be published automatically on the next push to `main`

## 3. References

TODO