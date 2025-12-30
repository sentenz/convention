# Software Engineering Laws

The software laws and principles govern the practice of software engineering, project management, team dynamics and system behaviour.

Laws provide insights into common pitfalls, team dynamics, and system behavior, helping teams navigate challenges and improve productivity.

- [1. Category](#1-category)
  - [1.1. Project Management \& Productivity](#11-project-management--productivity)
    - [1.1.1. Brooks’ Law (Law of Project Management)](#111-brooks-law-law-of-project-management)
    - [1.1.2. Hofstadter’s Law (Law of Effort Estimation)](#112-hofstadters-law-law-of-effort-estimation)
    - [1.1.3. Parkinson’s Law (Law of Time Expansion)](#113-parkinsons-law-law-of-time-expansion)
    - [1.1.4. Gilb’s Law (Law of Unstated Requirements)](#114-gilbs-law-law-of-unstated-requirements)
    - [1.1.5. Price’s Law (Law of Productivity Distribution)](#115-prices-law-law-of-productivity-distribution)
    - [1.1.6. Ringelmann Effect (Law of Diminishing Individual Productivity)](#116-ringelmann-effect-law-of-diminishing-individual-productivity)
    - [1.1.7. Goodhart’s Law (Law of Metric Corruption)](#117-goodharts-law-law-of-metric-corruption)
  - [1.2. Team \& Organizational Dynamics](#12-team--organizational-dynamics)
    - [1.2.1. Conway’s Law (Law of Organizational Structure)](#121-conways-law-law-of-organizational-structure)
    - [1.2.2. Inverse Conway’s Law (Reverse Conway Maneuver)](#122-inverse-conways-law-reverse-conway-maneuver)
    - [1.2.3. Cunningham’s Law (Law of Corrective Action)](#123-cunninghams-law-law-of-corrective-action)
  - [1.3. Software Behavior \& Evolution](#13-software-behavior--evolution)
    - [1.3.1. Zawinski’s Law (Law of Software Expansion)](#131-zawinskis-law-law-of-software-expansion)
    - [1.3.2. Hyrum’s Law (Law of Implicit Interfaces)](#132-hyrums-law-law-of-implicit-interfaces)
    - [1.3.3. Sturgeon’s Law (Law of Quality Distribution)](#133-sturgeons-law-law-of-quality-distribution)
    - [1.3.4. Postel’s Law (Robustness Principle / Law of Tolerance)](#134-postels-law-robustness-principle--law-of-tolerance)
    - [1.3.5. Amdahl’s Law (Law of Bottlenecks)](#135-amdahls-law-law-of-bottlenecks)
    - [1.3.6. CAP Theorem (Brewer’s Theorem / Law of Distributed Systems)](#136-cap-theorem-brewers-theorem--law-of-distributed-systems)
  - [1.4. Cognitive Biases \& Human Behavior](#14-cognitive-biases--human-behavior)
    - [1.4.1. Murphy’s Law (Law of Unintended Consequences)](#141-murphys-law-law-of-unintended-consequences)
    - [1.4.2. Cunningham’s Law (Law of Corrective Action)](#142-cunninghams-law-law-of-corrective-action)
    - [1.4.3. Goodhart’s Law (Law of Metric Corruption)](#143-goodharts-law-law-of-metric-corruption)
  - [1.5. Hardware, Networks \& External Trends](#15-hardware-networks--external-trends)
    - [1.5.1. Moore’s Law (Law of Growth)](#151-moores-law-law-of-growth)
    - [1.5.2. Wirth’s Law (Law of Slowing Software)](#152-wirths-law-law-of-slowing-software)
    - [1.5.3. Metcalfe’s Law (Law of Network Effects)](#153-metcalfes-law-law-of-network-effects)
    - [1.5.4. Pareto Principle (80/20 Rule)](#154-pareto-principle-8020-rule)

## 1. Category

### 1.1. Project Management & Productivity

#### 1.1.1. Brooks’ Law (Law of Project Management)

> Adding manpower to a late software project makes it later.

1. Example and Explanation

    - An 8-person team adds 5 more developers mid-project, delaying delivery due to onboarding and coordination.
      > New members require training and integration, increasing communication overhead that outweighs short-term productivity gains.

#### 1.1.2. Hofstadter’s Law (Law of Effort Estimation)

> It always takes longer than expected, even when accounting for it.

1. Example and Explanation

    - A feature estimated at 4 weeks (plus a 2-week buffer) still takes 8 weeks due to unforeseen API integration issues.
      > Complexity and unexpected dependencies make precise estimation inherently unreliable.

#### 1.1.3. Parkinson’s Law (Law of Time Expansion)

> Work expands to fill the time available.

1. Example and Explanation

    - A developer allots 3 days to fix a bug but uses the extra time to refactor unrelated code.
      > Without time constraints, work tends toward over-engineering or low-priority expansion.

#### 1.1.4. Gilb’s Law (Law of Unstated Requirements)

> Unstated requirements will remain unmet.

1. Example and Explanation

    - A client requests a “user-friendly dashboard” without performance metrics; it is delivered but rejected for being too slow.
      > Clear, measurable requirements are essential to align expectations.

#### 1.1.5. Price’s Law (Law of Productivity Distribution)

> Half the work is done by the square root of the team size.

1. Example and Explanation

    - In a 25-person team, ~5 contributors deliver 50% of the code.
      > Output is concentrated among a minority of contributors.

#### 1.1.6. Ringelmann Effect (Law of Diminishing Individual Productivity)

> Individual effort decreases as team size increases.

1. Example and Explanation

    - A 4-person team ships a feature in 10 days; a 12-person team takes 30 days due to coordination delays.
      > Accountability diffuses and communication overhead rises in larger groups.

#### 1.1.7. Goodhart’s Law (Law of Metric Corruption)

> When a metric becomes a target, it ceases to be a good metric.

1. Example and Explanation

    - Rewarding high code coverage leads to trivial tests that ignore real risks.
      > Metrics drive behavior, and focusing on the metric itself distorts its value.

### 1.2. Team & Organizational Dynamics

#### 1.2.1. Conway’s Law (Law of Organizational Structure)

> Systems mirror the communication structures of their creators.

1. Example and Explanation

    - Separate frontend and backend teams produce tightly coupled components.
      > Organizational silos translate into software silos.

#### 1.2.2. Inverse Conway’s Law (Reverse Conway Maneuver)

> Reorganizing teams can shape desired architecture.

1. Example and Explanation

    - Moving to cross-functional squads speeds microservices delivery.
      > Team structures can be engineered to encourage architectural goals.

#### 1.2.3. Cunningham’s Law (Law of Corrective Action)

> The fastest way to get the right answer is to post the wrong one.

1. Example and Explanation

    - A developer posts incorrect info about `==` in JavaScript, prompting multiple expert corrections.
      > People are more motivated to correct errors than to supply unsolicited answers.

### 1.3. Software Behavior & Evolution

#### 1.3.1. Zawinski’s Law (Law of Software Expansion)

> Every program expands until it can read email.

1. Example and Explanation

    - A text editor becomes a bloated IDE with chat and email integration.
      > Feature creep dilutes focus and increases complexity.

#### 1.3.2. Hyrum’s Law (Law of Implicit Interfaces)

> All observable behaviors will be depended upon.

1. Example and Explanation

    - Clients depend on an API’s undocumented sorting behavior, causing breakage when changed.
      > Backward compatibility must account for implicit as well as explicit contracts.

#### 1.3.3. Sturgeon’s Law (Law of Quality Distribution)

> 90% of everything is low quality.

1. Example and Explanation

    - Only 2 out of 20 libraries evaluated are usable.
      > High quality is rare; careful selection is essential.

#### 1.3.4. Postel’s Law (Robustness Principle / Law of Tolerance)

> Be conservative in what you send, liberal in what you accept.

1. Example and Explanation

    - A service emits strictly validated JSON but accepts minor format deviations in input.
      > Enhances interoperability and fault tolerance.

#### 1.3.5. Amdahl’s Law (Law of Bottlenecks)

> Parallelization is limited by the sequential portion of a task.

1. Example and Explanation

    - Image processing achieves 4× speedup with 8 cores due to 25% sequential steps.
      > Even small sequential sections limit scalability.

#### 1.3.6. CAP Theorem (Brewer’s Theorem / Law of Distributed Systems)

> Distributed systems cannot have Consistency, Availability, and Partition tolerance simultaneously.

1. Example and Explanation

    - A global database must choose between stale reads or downtime during a partition.
      > Forces explicit trade-offs in distributed architecture design.

### 1.4. Cognitive Biases & Human Behavior

#### 1.4.1. Murphy’s Law (Law of Unintended Consequences)

> Anything that can go wrong will go wrong.

1. Example and Explanation

    - A login system fails on launch due to an untested password edge case.
      > Designs should assume and plan for failure modes.

#### 1.4.2. Cunningham’s Law (Law of Corrective Action)

> The best way to get answers is to post the wrong one.

1. Example and Explanation

    - Posting incorrect information about a framework quickly prompts experts to correct it.
      > People are more motivated to fix mistakes than answer neutral questions.

#### 1.4.3. Goodhart’s Law (Law of Metric Corruption)

> When a metric becomes a target, it ceases to be a good metric.

1. Example and Explanation

    - Developers inflate story points to meet velocity goals.
      > Turning metrics into objectives changes behavior and undermines the measure.

### 1.5. Hardware, Networks & External Trends

#### 1.5.1. Moore’s Law (Law of Growth)

> Transistor count doubles approximately every two years.

1. Example and Explanation

    - 20B transistors in 2025 chips vs. <1B in 2005, enabling much higher performance.
      > Hardware advances have historically supported exponential growth in computational capacity.

#### 1.5.2. Wirth’s Law (Law of Slowing Software)

> Software slows faster than hardware speeds up.

1. Example and Explanation

    - Modern apps use more RAM and CPU than 20-year-old equivalents despite faster processors.
      > Bloat and abstraction layers consume hardware gains.

#### 1.5.3. Metcalfe’s Law (Law of Network Effects)

> Network value grows with the square of the number of users.

1. Example and Explanation

    - A messaging platform’s utility surges as the user base expands.
      > Each new participant adds disproportionately more potential connections.

#### 1.5.4. Pareto Principle (80/20 Rule)

> 80% of results come from 20% of causes.

1. Example and Explanation

    - 80% of bugs stem from 20% of code modules.
      > Focusing on high-impact areas yields outsized benefits.
