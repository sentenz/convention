# Deployment Strategies

[Deployment Strategies](https://cloud.google.com/architecture/application-deployment-and-testing-strategies) for Continuous Delivery (CD) define how you want to deliver, change or upgrade a running instance of an application.

Deployment strategies:

- Recreate, Reckless
  > Version 1 is terminated, and Version 2 is rolled out.
- Rolling, Ramped
  > Version 2 is gradually rolled out and replaces Version 1.
- Blue/Green, Dark/Light
  > Version 2 is released alongside Version 1; the traffic is switched to Version 2 after it is tested.
- Canary
  > Version 2 is released to a subset of users, followed by a full rollout.
- A/B
  > Version 2 is released, under specific conditions, to a subset of users.
- Shadow
  > Version 2 receives real-world traffic without impacting user requests.
