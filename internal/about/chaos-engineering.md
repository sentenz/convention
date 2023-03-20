# Chaos Engineering

Chaos engineering is a disciplined approach to building resilient and reliable software systems by intentionally introducing controlled chaos to uncover potential weaknesses and failures.

- [1. Category](#1-category)
  - [1.1. Chaos Levels](#11-chaos-levels)
    - [1.1.1. Application Level Chaos](#111-application-level-chaos)
    - [1.1.2. Infrastructure Level Chaos](#112-infrastructure-level-chaos)
    - [1.1.3. Network Level Chaos](#113-network-level-chaos)
    - [1.1.4. Data Level Chaos](#114-data-level-chaos)
    - [1.1.5. People/Process Level Chaos](#115-peopleprocess-level-chaos)
  - [1.2. Tools](#12-tools)
    - [1.2.1. Chaos Monkey](#121-chaos-monkey)
    - [1.2.2. Azure Chaos Studio](#122-azure-chaos-studio)
- [2. Principle](#2-principle)
- [3. Best Practice](#3-best-practice)
- [4. Terminology](#4-terminology)
- [5. References](#5-references)

## 1. Category

### 1.1. Chaos Levels

Chaos engineering approach provides a unique perspective on the system's behavior and can help identify different types of weaknesses or vulnerabilities. By combining different types of chaos engineering techniques, teams can gain a more comprehensive understanding of their system's resilience and build more reliable and resilient software systems.

#### 1.1.1. Application Level Chaos

Application Level Chaos involves injecting failure or disturbance at the application level of a software system to observe its behavior.

This might involve intentionally introducing latency, errors, or timeouts in API requests or database queries to test how the application handles these situations.

#### 1.1.2. Infrastructure Level Chaos

Infrastructure Level Chaos involves injecting failure or disturbance at the infrastructure level of a software system to observe its behavior.

This might include randomly shutting down servers, disconnecting network connections, or simulating hardware failures.

#### 1.1.3. Network Level Chaos

Network Level Chaos involves injecting failure or disturbance at the network level of a software system to observe its behavior.

This might include throttling network traffic, introducing packet loss or delay, or simulating network outages and traffic spikes

#### 1.1.4. Data Level Chaos

Data Level Chaos involves injecting failure or disturbance at the data level of a software system to observe its behavior.

This might include corrupting or deleting data, introducing data inconsistencies, or simulating data breaches.

#### 1.1.5. People/Process Level Chaos

People/Process Level Chaos involves injecting failure or disturbance at the people or process level of a software system to observe its behavior.

This might include intentionally misconfiguring systems, simulating human error, or testing disaster recovery procedures.

### 1.2. Tools

#### 1.2.1. Chaos Monkey

[Chaos Monkey](https://github.com/Netflix/chaosmonkey) randomly terminates virtual machine instances and containers that run inside of your production environment. Exposing engineers to failures more frequently incentivizes them to build resilient services.

#### 1.2.2. Azure Chaos Studio

[Azure Chaos Studio](https://azure.microsoft.com/en-us/products/chaos-studio/#overview) is an experimentation platform for improving app resiliency.

Improve application resilience with chaos testing by deliberately introducing faults that simulate real-world outages. Azure Chaos Studio Preview is a fully managed chaos engineering experimentation platform for accelerating discovery of hard-to-find problems, from late-stage development through production. Disrupt apps intentionally to identify gaps and plan mitigations before customers are impacted by a problem.

## 2. Principle

Chaos engineering is based on a set of principles that guide the design and execution of experiments to uncover potential system weaknesses.

These principles provide a framework for conducting chaos engineering experiments in a systematic and structured.

- Define a Hypothesis
  > Chaos engineering begins with defining a hypothesis, which is a statement about how the system will behave under certain conditions. The hypothesis is based on an understanding of the system's architecture, design, and expected behavior. The hypothesis should be clear, specific, and testable.

- Minimize Blast Radius
  > Chaos engineering experiments should be designed to minimize the impact on the overall system. This involves carefully selecting the scope of the experiment and ensuring that it can be safely and quickly rolled back if necessary. It is important to define the blast radius carefully to avoid causing widespread damage in the system.

- Vary Real-World Events
  > Chaos engineering involves varying real-world events to test the system's response. This might include introducing latency, errors, or other forms of disruption to see how the system behaves. The goal is to identify potential weaknesses or points of failure in the system.

- Automate Experiments
  > Chaos engineering experiments should be automated to ensure consistency and repeatability and to reduce the risk of human error. This involves creating scripts or other tools to introduce failures or disruptions and collect data about the system's behavior.

- Measure everything
  > Chaos engineering experiments should collect and analyze data on system behavior, performance, and response to the failure or disturbance. This data should be used to validate or refute the hypothesis and identify potential weaknesses in the system.

- Learn from Failures
  > Chaos engineering is an iterative process that involves learning from failures and using that knowledge to improve the system. When a failure occurs, it should be analyzed to understand the root cause and determine how it can be prevented in the future.

- Share Results
  > The results of chaos engineering experiments should be shared with the broader team to facilitate learning and improve the overall resilience of the system. This involves documenting the experiment design, results, and any insights or lessons learned.

## 3. Best Practice

Best practices provide guidance for conducting effective chaos engineering experiments to gain meaningful insights into system resilience.

- Start Small
  > Begin with small, controlled experiments to build confidence in the process and validate the tools and techniques being used.

- Start with a Baseline
  > Before conducting any chaos engineering experiments, it is important to establish a baseline for the system's normal behavior. This involves monitoring key metrics such as response time, throughput, and error rates under normal operating conditions. By establishing a baseline, you can more easily identify deviations from normal behavior during chaos engineering experiments.

- Use Production-like Environments
  > Chaos engineering experiments should be performed in production-like environments that replicate the complexities and dynamics of the real production environment.

- Involve Cross-Functional Teams
  > Chaos engineering experiments should involve cross-functional teams that represent different areas of the organization, including development, operations, security, and business stakeholders. By involving a diverse group of stakeholders, you can ensure that chaos engineering experiments are aligned with the needs of the organization and that any issues that arise are addressed holistically.

- Focus on Business Outcomes
  > When conducting chaos engineering experiments, it is important to focus on business outcomes rather than technical metrics. This means identifying key performance indicators (KPIs) that are important to the business, such as customer satisfaction, revenue, or user engagement. By focusing on business outcomes, you can ensure that your chaos engineering experiments are aligned with the overall goals of the organization.

- Use Realistic Scenarios
  > When designing chaos engineering experiments, it is important to use realistic scenarios that are relevant to the system and its users. This might involve simulating a surge in traffic, a database outage, or other types of failure scenarios. By using realistic scenarios, you can more accurately assess the system's resilience in real-world situations.

- Prioritize Experiment Scenarios
  > Experiment scenarios should be prioritized based on the likelihood of occurrence and the potential impact on the system. This helps ensure that the most critical scenarios are tested first.

- Document and Share Results
  > Documenting and sharing the results of chaos engineering experiments helps to build a culture of learning and improvement. This information can also be used to develop new tests and improve existing ones.

- Automate Where Possible
  > Automation helps to ensure consistency and repeatability in experiments. This also allows for more frequent testing and reduces the likelihood of errors caused by manual intervention.

- Measure Success
  > Measuring the success of chaos engineering experiments is important for assessing the effectiveness of the approach and identifying areas for improvement. Metrics such as system uptime, error rates, and response times can be used to evaluate the impact of experiments on the system.

- Continuously Monitor and Iterate
  > Chaos engineering is an iterative process that requires continuous monitoring and iteration. This means regularly monitoring the system's behavior and making adjustments to the chaos engineering experiments as necessary. By continuously monitoring and iterating, you can ensure that the system remains resilient over time.

## 4. Terminology

Terminologies provide a common language for discussing and conducting chaos engineering experiments. By understanding these terminologies, teams can more effectively communicate and collaborate on building resilient and reliable software systems.

- Chaos Engineering
  > A practice that involves intentionally introducing failures and disruptions into a system to test its resiliency and identify weaknesses.

- Hypothesis
  > A statement about how a system will behave under certain conditions. A hypothesis is the starting point for a chaos engineering experiment.

- Blast Radius
  > The scope of a chaos engineering experiment. This refers to the parts of the system that will be affected by the experiment and the potential impact of any failures.

- Game Days
  > A type of chaos engineering experiment that involves simulating real-world events, such as a surge in traffic or a major outage, to test the system's response.

- Chaos Monkey
  > An open-source tool developed by Netflix that randomly terminates instances in their production environment to test the resiliency of their system.

- Fault Injection
  > A technique used in chaos engineering that involves intentionally introducing failures or errors into a system to test its response.

- Steady State
  > The normal operating conditions of a system. Chaos engineering experiments are designed to test how the system responds to disruptions and failures while still maintaining a steady state.

- Rollback Plan
  > A plan for quickly reverting the system to its previous state in case a chaos engineering experiment causes a significant impact on the system.

- Resilience
  > The ability of a system to withstand and recover from disruptions and failures.

## 5. References

- Microsoft [chaos engineering](https://learn.microsoft.com/en-us/azure/architecture/framework/resiliency/chaos-engineering) article.
- GitHub [chaos engineering principles](https://github.com/chaos-eng/chaos-eng.github.io) repository.
