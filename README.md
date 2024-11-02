# Convention

General articles, conventions and guides for software development.

- [1. Usage](#1-usage)
  - [1.1. Identity and Access](#11-identity-and-access)
  - [1.2. Commands and Operations](#12-commands-and-operations)
- [2. License](#2-license)

## 1. Usage

### 1.1. Identity and Access

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

### 1.2. Commands and Operations

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

## 2. License

`Apache-2.0` Licensed. See the [LICENSE](LICENSE) file for details.
