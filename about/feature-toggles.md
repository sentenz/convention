# Feature Toggles

[Feature Toggles](https://www.martinfowler.com/articles/feature-toggles.html) (often also referred to as Feature Flags) are a powerful technique, allowing teams to modify system behavior without changing code. They fall into various usage categories, and it's important to take that categorization into account when implementing and managing toggles. Toggles introduce complexity. We can keep that complexity in check by using smart toggle implementation practices and appropriate tools to manage our toggle configuration, but we should also aim to constrain the number of toggles in our system.

Categories of toggles:

- Release Toggles
  > Release Toggles allow incomplete and un-tested codepaths to be shipped to production as latent code which may never be turned on.

- Experiment Toggles
  > Experiment Toggles are used to perform multivariate or A/B testing.

- Ops Toggles
  > These flags are used to control operational aspects of our system's behavior.

- Permissioning Toggles
  > These flags are used to change the features or product experience that certain users receive.
