# Software Metrics

Software Metrics are measurements used to assess various aspects of the software development process, project, or product. They help teams track progress, identify bottlenecks, make informed decisions, and improve overall efficiency and quality.

- [1. Category](#1-category)
  - [1.1. Metrics](#11-metrics)
    - [1.1.1. Primary Metrics](#111-primary-metrics)
    - [1.1.2. Meta Metrics](#112-meta-metrics)
  - [1.2. Standards](#12-standards)
    - [1.2.1. OpenMetrics](#121-openmetrics)
  - [1.3. Types](#13-types)
    - [1.3.1. Size Metrics](#131-size-metrics)
      - [1.3.1.1. Lines of Code (LOC)](#1311-lines-of-code-loc)
      - [1.3.1.2. Source Lines of Code (SLOC)](#1312-source-lines-of-code-sloc)
      - [1.3.1.3. Function Points (FP)](#1313-function-points-fp)
    - [1.3.2. Complexity Metrics](#132-complexity-metrics)
      - [1.3.2.1. Cyclomatic Complexity](#1321-cyclomatic-complexity)
      - [1.3.2.2. Halstead Complexity Measures](#1322-halstead-complexity-measures)
      - [1.3.2.3. Kolmogorov Complexity](#1323-kolmogorov-complexity)
      - [1.3.2.4. Maintainability Index](#1324-maintainability-index)
    - [1.3.3. Quality Metrics](#133-quality-metrics)
      - [1.3.3.1. Defect Density](#1331-defect-density)
      - [1.3.3.2. Failure Rate](#1332-failure-rate)
      - [1.3.3.3. Code Churn](#1333-code-churn)
    - [1.3.4. Efficiency Metrics](#134-efficiency-metrics)
      - [1.3.4.1. Execution Time](#1341-execution-time)
      - [1.3.4.2. Memory Consumption](#1342-memory-consumption)
    - [1.3.5. Testing Metrics](#135-testing-metrics)
      - [1.3.5.1. Test Coverage](#1351-test-coverage)
      - [1.3.5.2. Code Coverage](#1352-code-coverage)
      - [1.3.5.3. Defect Detection Percentage](#1353-defect-detection-percentage)
    - [1.3.6. Productivity Metrics](#136-productivity-metrics)
      - [1.3.6.1. Velocity](#1361-velocity)
      - [1.3.6.2. Work Completed](#1362-work-completed)
      - [1.3.6.3. Effort Expended](#1363-effort-expended)
    - [1.3.7. Coupling Metrics](#137-coupling-metrics)
      - [1.3.7.1. Coupling Between Objects (CBO)](#1371-coupling-between-objects-cbo)
      - [1.3.7.2. Afferent/Efferent Couplings (Ca and Ce)](#1372-afferentefferent-couplings-ca-and-ce)
    - [1.3.8. Cohesion Metrics](#138-cohesion-metrics)
      - [1.3.8.1. Lack of Cohesion in Methods (LCOM)](#1381-lack-of-cohesion-in-methods-lcom)
    - [1.3.9. Change Control Metrics](#139-change-control-metrics)
      - [1.3.9.1. Change Request Count](#1391-change-request-count)
      - [1.3.9.2. Change Success Rate](#1392-change-success-rate)
    - [1.3.10. Performance Metrics](#1310-performance-metrics)
      - [1.3.10.1. Response Time](#13101-response-time)
      - [1.3.10.2. Throughput](#13102-throughput)
    - [1.3.11. Reliability Metrics](#1311-reliability-metrics)
      - [1.3.11.1. Mean Time Between Failures (MTBF)](#13111-mean-time-between-failures-mtbf)
      - [1.3.11.2. Mean Time to Repair (MTTR)](#13112-mean-time-to-repair-mttr)
      - [1.3.11.3. Mean Time to Acknowledge (MTTA)](#13113-mean-time-to-acknowledge-mtta)
      - [1.3.11.4. Mean Time to Failure (MTTF)](#13114-mean-time-to-failure-mttf)
    - [1.3.12. Vulnerability Metrics](#1312-vulnerability-metrics)
      - [1.3.12.1. CVSS](#13121-cvss)
      - [1.3.12.2. EPSS](#13122-epss)
  - [1.4. Standards](#14-standards)
  - [1.5. Frameworks](#15-frameworks)
  - [1.6. Tools](#16-tools)
- [2. References](#2-references)

## 1. Category

### 1.1. Metrics

#### 1.1.1. Primary Metrics

Primary metrics are the core measurements used to assess specific aspects of the software development process, project, or product. These metrics directly relate to the goals and objectives of the software development effort and provide insights into the performance, progress, and quality of the development activities.

Primary metrics provide valuable insights into the effectiveness of the software development process and its alignment with business goals. They help teams make data-driven decisions, identify areas for improvement, and track progress over time.

- Cycle Time
  > The time taken to complete a unit of work, like a user story or a feature, from start to finish.

- Code Review Turnaround Time
  > The time it takes to review and approve/reject code changes submitted by team members.

- Bugs Open/Closed
  > The number of open and closed bugs over time, helping to assess the health of the project.

- Release Frequency
  > How often new releases or updates are deployed to production.

- Customer Satisfaction
  > Feedback from users or stakeholders about the quality and functionality of the software.

- Effort Variance
  > A comparison of the estimated effort versus the actual effort spent on a task or project.

- Code Complexity
  > Measures like cyclomatic complexity that assess the complexity of the codebase, potentially indicating areas that need refactoring.

- Build Success Rate
  > The percentage of successful builds compared to total attempts.

- Technical Debt
  > An estimation of the effort required to address accumulated technical issues or shortcuts in the codebase.

#### 1.1.2. Meta Metrics

Meta-metrics, also known as `metrics about metrics`, focus on the measurement process itself. They assess the quality, accuracy, and effectiveness of the primary metrics being collected. Meta-metrics help ensure that the measurement process is reliable, consistent, and provides meaningful insights.

By monitoring and optimizing meta-metrics, organizations can ensure the accuracy, reliability, and usefulness of their primary metrics, leading to more informed decision-making and effective process improvement.

- Data Completeness
  > Measures the extent to which all required data points are being captured accurately and consistently. Incomplete data can lead to inaccurate analysis and conclusions.

- Data Accuracy
  > Assesses the correctness and reliability of the data being collected. Incorrect data can result in misleading insights and decisions.

- Data Timeliness
  > Measures how quickly data is collected and entered into the measurement system. Timely data is crucial for real-time analysis and decision-making.

- Metric Relevance
  > Evaluates whether the chosen metrics align with the goals and objectives of the measurement process. Irrelevant metrics can waste resources and lead to incorrect conclusions.

- Metric Validity
  > Determines whether the selected metrics accurately measure what they are intended to measure. Valid metrics provide meaningful insights.

- Metric Reliability
  > Reflects the consistency and stability of metric measurements over time. Unreliable metrics can lead to uncertainty and lack of trust.

- Metric Sensitivity
  > Indicates how well a metric captures variations and changes in the process being measured. Metrics should be sensitive enough to detect meaningful differences.

- Metric Precision
  > Measures the level of detail and accuracy in metric measurements. Precise metrics provide more accurate and refined insights.

- Metric Interpretability
  > Assesses how easily metric results can be understood and interpreted by stakeholders. Complex metrics can hinder effective communication.

- Metric Bias
  > Checks for any systematic errors or distortions in metric measurements. Bias can lead to skewed perceptions of performance.

- Metric Stability
  > Examines the consistency of metric measurements across different contexts and environments. Stable metrics are reliable under varying conditions.

- Metric Overhead
  > Measures the effort, time, and resources required to collect and analyze metric data. Excessive overhead can discourage the use of metrics.

- Metric Correlation
  > Analyzes the relationships between different metrics to identify dependencies and interactions that might affect interpretations.

### 1.2. Standards

#### 1.2.1. OpenMetrics

[OpenMetrics](https://openmetrics.io/) specifies standard for transmitting cloud-native metrics at scale, with support for both text representation and Protocol Buffers and brings it into an `Internet Engineering Task Force (IETF)` standard.

Examples and Explanations:

- `metrics.txt`
  > Creating individual entries for each metric with proper formatting and metadata to generate a comprehensive `metrics.txt` file using for Gitlab report.

  ```plaintext
  # HELP code_coverage The percentage of code that is covered by tests
  # TYPE code_coverage gauge
  code_coverage 85.6

  # HELP unit_test_ratio The ratio of unit tests that passed to the total number of unit tests
  # TYPE unit_test_ratio gauge
  unit_test_ratio 0.98

  # HELP build_time The time it took to build the project in seconds
  # TYPE build_time gauge
  build_time 120.3

  # HELP memory_usage The amount of memory used by the project in bytes
  # TYPE memory_usage gauge
  memory_usage 1.2e+9

  # HELP performance_benchmarks A summary of the performance benchmarks for the project
  # TYPE performance_benchmarks summary
  performance_benchmarks{quantile="0.5"} 0.15
  performance_benchmarks{quantile="0.9"} 0.25
  performance_benchmarks{quantile="0.99"} 0.35
  performance_benchmarks_sum 1500
  performance_benchmarks_count 10000

  # HELP code_complexity The average cyclomatic complexity of the code
  # TYPE code_complexity gauge
  code_complexity 12.4

  # HELP deployment_rate The rate of successful deployments to the total number of deployments
  # TYPE deployment_rate gauge
  deployment_rate 0.95
  ```

- Code Coverage (%)

  ```plaintext
  # HELP code_coverage_percentage Percentage of code covered by unit tests
  # TYPE code_coverage_percentage gauge
  code_coverage_percentage 78.5
  ```

- Unit Test Pass/Fail Ratio

  ```plaintext
  # HELP unit_test_pass_ratio Ratio of passed unit tests to total tests
  # TYPE unit_test_pass_ratio gauge
  unit_test_pass_ratio 0.95 (passed_tests / total_tests)

  # HELP unit_test_failures Number of failed unit tests
  # TYPE unit_test_failures counter
  unit_test_failures 12
  ```

- Build Time (seconds)

  ```plaintext
  # HELP build_time_seconds Duration of the build process
  # TYPE build_time_seconds gauge
  build_time_seconds 120.5
  ```

- Memory Usage (bytes)

  ```plaintext
  # HELP peak_memory_usage_bytes Maximum memory used during build or runtime
  # TYPE peak_memory_usage_bytes gauge
  peak_memory_usage_bytes 1536440320 (peak_memory_used)
  ```

- Performance Benchmarks

  ```plaintext
  # HELP request_latency_milliseconds Average latency of API requests
  # TYPE request_latency_milliseconds gauge
  request_latency_milliseconds 50.2

  # HELP request_throughput_requests_per_second Number of requests served per second
  # TYPE request_throughput_requests_per_second gauge
  request_throughput_requests_per_second 200
  ```

- Code Complexity (cyclomatic complexity)

  ```plaintext
  # HELP average_cyclomatic_complexity Average cyclomatic complexity of code files
  # TYPE average_cyclomatic_complexity gauge
  average_cyclomatic_complexity 8.5

  # HELP max_cyclomatic_complexity Maximum cyclomatic complexity of any code file
  # TYPE max_cyclomatic_complexity gauge
  max_cyclomatic_complexity 15
  ```

- Deployment Success/Failure Rate

  ```plaintext
  # HELP deployment_success_rate Ratio of successful deployments to total attempts
  # TYPE deployment_success_rate gauge
  deployment_success_rate 0.98 (successful_deployments / total_deployments)

  # HELP deployment_failures Number of deployment failures
  # TYPE deployment_failures counter
  deployment_failures 2
  ```

### 1.3. Types

#### 1.3.1. Size Metrics

##### 1.3.1.1. Lines of Code (LOC)

Convention and Standards:

- PEP 8

Tools and Frameworks:

- SonarQube

##### 1.3.1.2. Source Lines of Code (SLOC)

Convention and Standards:

Tools and Frameworks:

- SLOCCount

##### 1.3.1.3. Function Points (FP)

Convention and Standards:

- PEP 8

Tools and Frameworks:

- IFPUG

#### 1.3.2. Complexity Metrics

##### 1.3.2.1. Cyclomatic Complexity

Convention and Standards:

Tools and Frameworks:

##### 1.3.2.2. Halstead Complexity Measures

Convention and Standards:

Tools and Frameworks:

##### 1.3.2.3. Kolmogorov Complexity

##### 1.3.2.4. Maintainability Index

Convention and Standards:

Tools and Frameworks:

- Understand

- SonarQube

#### 1.3.3. Quality Metrics

##### 1.3.3.1. Defect Density

The number of defects or issues found in the software per unit of code, typically per lines of code (LOC) or function points.

Convention and Standards:

Tools and Frameworks:

##### 1.3.3.2. Failure Rate

Convention and Standards:

Tools and Frameworks:

##### 1.3.3.3. Code Churn

The rate of code changes or additions, indicating the level of activity in the codebase.

Convention and Standards:

Tools and Frameworks:

- JIRA
  
- Bugzilla

#### 1.3.4. Efficiency Metrics

##### 1.3.4.1. Execution Time

##### 1.3.4.2. Memory Consumption

Convention and Standards:

- Performance Testing

Tools and Frameworks:

- Apache JMeter

- LoadRunner

#### 1.3.5. Testing Metrics

##### 1.3.5.1. Test Coverage

Convention and Standards:

Tools and Frameworks:

##### 1.3.5.2. Code Coverage

Convention and Standards:

Tools and Frameworks:

##### 1.3.5.3. Defect Detection Percentage

Convention and Standards:

- Test Frameworks

Tools and Frameworks:

- JaCoCo
- Istanbul
- JUnit

#### 1.3.6. Productivity Metrics

##### 1.3.6.1. Velocity

A metric used in Agile methodologies like Scrum to measure the rate at which a team completes work during a specific time frame, often a sprint.

##### 1.3.6.2. Work Completed

##### 1.3.6.3. Effort Expended

Convention and Standards:

- Scrum

- Kanban

Tools and Frameworks:

- Jira Agile

- VersionOne

#### 1.3.7. Coupling Metrics

##### 1.3.7.1. Coupling Between Objects (CBO)

##### 1.3.7.2. Afferent/Efferent Couplings (Ca and Ce)

Convention and Standards:

- SOLID

Tools and Frameworks:

- JDepend
- SonarQube

#### 1.3.8. Cohesion Metrics

##### 1.3.8.1. Lack of Cohesion in Methods (LCOM)

Convention and Standards:

- CDD (Component-Driven Development)

Tools and Frameworks:

#### 1.3.9. Change Control Metrics

##### 1.3.9.1. Change Request Count

##### 1.3.9.2. Change Success Rate

Convention and Standards:

- ITIL

Tools and Frameworks:

- ServiceNow
- BMC Remedy

#### 1.3.10. Performance Metrics

##### 1.3.10.1. Response Time

##### 1.3.10.2. Throughput

Convention and Standards:

- Performance Testing

Tools and Frameworks:

- Apache JMeter
- LoadRunner

#### 1.3.11. Reliability Metrics

Reliability Metrics quantify the dependability, serviceability, and operational performance of software-intensive systems. They are critical in **system operations, maintenance engineering, and IT service management (ITSM)**, enabling organizations to assess not only how often systems fail, but also how efficiently failures are detected, acknowledged, and resolved.  

Reliability metrics form the **operational resilience measurement**, supporting service-level agreements (SLAs), reliability-centered maintenance strategies, and compliance with standards such as:  

- **IEEE 1061** (*Standard for a Software Quality Metrics Methodology*)  
- **ISO/IEC 25010** (*Systems and Software Quality Models*)  
- **ITIL/ISO 20000** (*Service Management Frameworks*)

##### 1.3.11.1. Mean Time Between Failures (MTBF)

- **Definition**: The arithmetic mean of the time intervals between consecutive system failures.  
- **Purpose**: Serves as a measure of *system reliability*. A higher MTBF indicates fewer failures over time, suggesting more stable operation.  
- **Applicability**: Most relevant for repairable systems, such as servers, enterprise applications, or network infrastructure.  

1. Formula and Equation

    ```math
    MTBF = \frac{\text{Total operational uptime}}{\text{Number of failures}}
    ```

##### 1.3.11.2. Mean Time to Repair (MTTR)

- **Definition**: The average elapsed time required to diagnose, repair, and restore functionality after a system failure.  
- **Purpose**: Indicates *system maintainability* and operational efficiency in incident recovery.  
- **Applicability**: Employed in contexts where rapid service restoration is paramount, such as mission-critical applications or high-availability platforms.  

1. Formula and Equation

    ```math
    MTTR = \frac{\text{Total downtime due to repairs}}{\text{Number of repair incidents}}
    ```

##### 1.3.11.3. Mean Time to Acknowledge (MTTA)

- **Definition**: The average duration from the occurrence of an incident to the point when responsible personnel acknowledge its detection.  
- **Purpose**: Measures the *responsiveness of monitoring and alerting processes*. A lower MTTA signifies effective detection and escalation workflows.  
- **Applicability**: Especially critical in environments with automated monitoring (DevOps, Site Reliability Engineering), where early acknowledgment is a prerequisite for reducing total downtime.  

1. Formula and Equation

    ```math
    MTTA = \frac{\text{Sum of acknowledgment times}}{\text{Number of incidents}}
    ```

##### 1.3.11.4. Mean Time to Failure (MTTF)

- **Definition**: The expected time until the *first failure* occurs in a non-repairable system or component.  
- **Purpose**: Functions as a measure of inherent product reliability and design robustness.  
- **Applicability**: Applied to non-repairable components (e.g., embedded chips, sensors, or consumable parts), where replacement—not repair—is the only option after failure.

1. Formula and Equation

    ```math
    MTTF = \frac{\text{Total operational time of all units tested}}{\text{Number of units}}
    ```

#### 1.3.12. Vulnerability Metrics

##### 1.3.12.1. CVSS

The [Common Vulnerability Scoring System (CVSS)](https://www.first.org/cvss/) is a standardized framework for assessing the severity of software vulnerabilities. It provides a numerical score (ranging from 0 to 10) that reflects the potential impact of a vulnerability on a system, helping organizations prioritize their response and remediation efforts.

1. Formula and Equation

    - CVSS Rating Scale
      > [NVD Vulnerability Metrics](https://nvd.nist.gov/vuln-metrics/cvss) qualitative severity ratings are derived from the CVSS score.

      | Severity | CVSS    | Description                                                                                                                                                   |
      | -------- | ------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------- |
      | Critical | 9.0–10  | Severe vulnerabilities that can result in complete compromise of confidentiality, integrity, or availability, often remotely exploitable with minimal effort. |
      | High     | 7.0–8.9 | Significant vulnerabilities that may allow partial compromise of critical assets, require attention in expedited timelines.                                   |
      | Medium   | 4.0–6.9 | Vulnerabilities with limited impact or requiring specific conditions to exploit, manageable with standard patch cycles.                                       |
      | Low      | 0.1–3.9 | Minor vulnerabilities or those with negligible security impact, remediation may be deferred to maintenance cycles.                                            |
      | None     | 0.0     | No impact vulnerabilities, informational only.                                                                                                                |

##### 1.3.12.2. EPSS

The [Exploit Prediction Scoring System (EPSS)](https://www.first.org/epss/) is a metric that estimates the likelihood of a software vulnerability being exploited in the real-world. It provides a score (ranging from 0 to 1) that helps organizations assess the risk associated with a vulnerability and prioritize their mitigation efforts accordingly.

1. Formula and Equation

    - EPSS Rating Scale
      > Qualitative severity ratings are derived from the EPSS score.

      | Severity | EPSS      | Description                                                                                              |
      | -------- | --------- | -------------------------------------------------------------------------------------------------------- |
      | High     | 07–1.0    | High probability of exploitation in the real-world, indicates urgent need for remediation or mitigation. |
      | Medium   | 0.3–0.69  | Moderate likelihood of exploitation, requires timely remediation but not necessarily immediate response. |
      | Low      | 0.01–0.29 | Low likelihood of exploitation, remediation can follow normal patch cycles.                              |
      | None     | 0.0       | No observed or predicted exploit activity.                                                               |

### 1.4. Standards

Standards and guidelines provide recommendations for Software metric. These standards help organizations establish consistent and effective practices for measuring and improving software development processes.

- ISO/IEC 15939 (Software Measurement Process)
  > This international standard provides guidance on establishing a measurement process for software development and maintenance. It covers measurement framework, planning, implementation, and analysis.

- ISO/IEC 25010 (Systems and Software Quality Requirements and Evaluation - SQuaRE)
  > Part of the SQuaRE series, this standard defines a comprehensive set of quality characteristics and sub-characteristics for software products. It offers guidance on assessing and measuring software quality.

- CMMI (Capability Maturity Model Integration)
  > While not exclusively focused on metrics, CMMI provides a framework for process improvement in various domains, including software development. It includes guidance on measurement and analysis practices.

- ISO/IEC TR 90006 (Guidance on the Application of ISO 9001:2015 to IT Service Management and Software Engineering)
  > This technical report provides guidance on adapting ISO 9001 quality management principles to software engineering processes, including measurement and metrics.

- ISO/IEC TR 20000-7 (Guidance on the Integration and Correlation of ISO/IEC 20000-1:2018 and ISO/IEC 12207:2017)
  > This technical report provides guidance on integrating service management and software engineering processes, which may involve metrics alignment.

- IEEE Standard 1061 (Software Metrics)
  > This IEEE standard provides definitions and guidelines for various software metrics, helping organizations establish consistent measurement practices.

- SEI (Software Engineering Institute) Metrics Program
  > The SEI offers guidance on software measurement and metrics through various resources, including books, articles, and training.

### 1.5. Frameworks

> NOTE When choosing a framework, consider the organization's goals, methodologies, and specific needs. Remember that metrics should be chosen thoughtfully, aligned with objectives, and not used in isolation. Also, be cautious about potential unintended consequences, such as optimizing for metrics at the expense of overall quality or customer satisfaction.

- Goal-Question-Metric (GQM) Framework
  > GQM is a goal-oriented approach that helps define goals, questions, and corresponding metrics. It ensures that metrics are aligned with specific objectives and provide meaningful insights.

- Key Performance Indicators (KPIs)
  > KPIs are specific metrics that organizations use to measure progress towards strategic goals. They focus on critical success factors and are often used at higher levels of decision-making.

- Software Engineering Institute (SEI) CMMI
  > The Capability Maturity Model Integration provides a structured framework for process improvement across various domains, including software development. It includes performance measurement and metrics as a key component.

- ISO/IEC 25010 (SQuaRE)
  > This standard defines a comprehensive set of software quality attributes and their sub-characteristics. It provides a structured approach for measuring software quality and performance.

- Agile Metrics Frameworks
  > Agile methodologies have their own set of metrics frameworks, such as SAFe (Scaled Agile Framework) metrics and Disciplined Agile Delivery (DAD) metrics, which are tailored to the Agile development context.

- Balanced Scorecard (BSC)
  > While not specific to software development, BSC is a strategic performance management framework that helps organizations track and manage their overall performance using a balanced set of financial and non-financial metrics.

- Lean Software Development Metrics
  > Inspired by Lean principles, this framework focuses on minimizing waste, improving flow, and delivering value. Metrics like cycle time, lead time, and work in progress (WIP) are commonly used in this context.

- DORA
  > The DevOps Research and Assessment (DORA) framework emphasizes Four Key Metrics of DevOps related to `Deployment Frequency`, `Lead Time`, `Change Failure Rate`, and `Time to Restore Service`. It's geared towards improving software delivery and operations.
  >
  > NOTE See [DORA](../about/dora.md) for details.

- SPACE
  > The SPACE framework is a set of metrics that measure the capabilities of software development teams. The SPACE framework divides the capabilities of software development teams into five categories: satisfaction and well-being, performance, activity, collaboration and communication, and efficiency and flow.

### 1.6. Tools

Tools offer a range of capabilities, from tracking code quality and deployment metrics to monitoring application performance and user experience.

- Jira
  > A widely used project management and issue tracking tool that offers customizable dashboards and reporting features to track various metrics.

- GitLab
  > A platform that provides version control, CI/CD pipelines, and issue tracking, along with built-in metrics and analytics for software development processes.

- GitHub
  > Similar to GitLab, GitHub offers version control and issue tracking, with additional integrations and extensions for tracking Software metric.

- Azure DevOps (formerly Visual Studio Team Services)
  > A set of development tools that includes version control, CI/CD pipelines, and work tracking with built-in reporting and analytics.

- Jenkins
  > An open-source automation server that can be configured to generate various metrics related to build and deployment processes.

- SonarQube
  > A tool for continuous code quality inspection, providing metrics on code smells, bugs, vulnerabilities, and code coverage.

- New Relic
  > A monitoring and observability platform that offers insights into application performance, user experience, and infrastructure metrics.

- Prometheus
  > An open-source monitoring and alerting toolkit that specializes in collecting and displaying metrics from applications and systems.

- Grafana
  > A popular open-source dashboard and visualization platform that can integrate with various data sources, including metrics from software development processes.

- Opsgenie
  > A tool for incident management and alerting that can help measure metrics related to incident response times and resolution.

- Datadog
  > A monitoring and analytics platform that provides insights into application performance, infrastructure metrics, and logs.

- Trello
  > A visual project management tool that can be customized to track various development metrics using boards and cards.

## 2. References

- Sentenz [Telemetry](../articles/telemetry.md) article.
- Wikipedia [Software Metric](https://en.wikipedia.org/wiki/Software_metric) page.
- NIST [Vulnerability Metrics CVSS](https://nvd.nist.gov/vuln-metrics/cvss) page.
- Atlassian [Incident Metrics]([../articles/telemetry.md](https://www.atlassian.com/incident-management/kpis/common-metrics)) page.
