# Twelve-Factor App

The [twelve-factor app](https://12factor.net/) methodology describes a set of principles and best practices, to develop scalable and resilient apps that can be continuously deployed with maximum agility.

- [See also](#see-also)

The twelve factors:

1. Codebase
2. Dependencies
3. Configuration
   > Prescribes that configuration and secrets be externalized outside of the code base.
   >
   > - Load environment variables from a [.env](https://github.com/motdotla/dotenv) file.
   > - Isolate secrets in a secrets management tool like Hashicorp [Vault](https://github.com/hashicorp/vault).
   > - [Dapr](https://github.com/dapr/dapr) offers a [secrets management building block](https://docs.dapr.io/developing-applications/building-blocks/secrets/secrets-overview/) abstracts away the complexity of working with secrets and secret management tools.
   >
4. Backing services
5. Build, release, run
6. Processes
7. Port binding
8. Concurrency
9. Disposability
10. Environment parity
11. Logs
12. Admin processes

## See also

- [Google twelve-factor app](https://cloud.google.com/architecture/twelve-factor-app-development-on-gcp?hl=en)
