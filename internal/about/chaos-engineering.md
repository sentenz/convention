# Chaos Engineering

[Chaos Engineering](https://learn.microsoft.com/en-us/azure/architecture/framework/resiliency/chaos-engineering) is the practice of subjecting applications and services to real-world stresses and failures to build and validate resilience to unreliable conditions and missing dependencies.

- [1. Principles](#1-principles)
- [2. Tools](#2-tools)
  - [2.1. Chaos Monkey](#21-chaos-monkey)
  - [2.2. Azure Chaos Studio](#22-azure-chaos-studio)

## 1. Principles

[Chaos Engineering Principles](https://github.com/chaos-eng/chaos-eng.github.io) is the process of testing a distributed computing system to ensure that it can withstand unexpected disruptions. It relies on concepts underlying chaos theory, which focus on random and unpredictable behavior. The goal of chaos engineering is to identify weakness in a system through controlled experiments that introduce random and unpredictable behavior.

## 2. Tools

### 2.1. Chaos Monkey

[Chaos Monkey](https://github.com/Netflix/chaosmonkey) randomly terminates virtual machine instances and containers that run inside of your production environment. Exposing engineers to failures more frequently incentivizes them to build resilient services.

### 2.2. Azure Chaos Studio

[Azure Chaos Studio](https://azure.microsoft.com/en-us/products/chaos-studio/#overview) is an experimentation platform for improving app resiliency.

Improve application resilience with chaos testing by deliberately introducing faults that simulate real-world outages. Azure Chaos Studio Preview is a fully managed chaos engineering experimentation platform for accelerating discovery of hard-to-find problems, from late-stage development through production. Disrupt apps intentionally to identify gaps and plan mitigations before customers are impacted by a problem.
