# Software Metric

Software metric are measurements used to assess various aspects of the software development process, project, or product. They help teams track progress, identify bottlenecks, make informed decisions, and improve overall efficiency and quality.

- [1. Category](#1-category)
  - [1.1. Metrics](#11-metrics)
    - [1.1.1. Primary Metrics](#111-primary-metrics)
    - [1.1.2. Meta-Metrics](#112-meta-metrics)
  - [1.2. Standards](#12-standards)
  - [1.3. Frameworks](#13-frameworks)
  - [1.4. Tools](#14-tools)
- [2. References](#2-references)

## 1. Category

### 1.1. Metrics

#### 1.1.1. Primary Metrics

Primary metrics are the core measurements used to assess specific aspects of the software development process, project, or product. These metrics directly relate to the goals and objectives of the software development effort and provide insights into the performance, progress, and quality of the development activities.

Primary metrics provide valuable insights into the effectiveness of the software development process and its alignment with business goals. They help teams make data-driven decisions, identify areas for improvement, and track progress over time.

1. Cycle Time

    The time taken to complete a unit of work, like a user story or a feature, from start to finish.

2. Lead Time

    The time taken from the initiation of work to its completion, often measured in days or weeks.

3. Velocity

    A measure of a team's output or productivity, typically used in Agile methodologies like Scrum, calculated based on the number of story points completed in a sprint.

4. Defect Density

    The number of defects or issues found in the software per unit of code (e.g., per 1000 lines of code).

5. Code Churn

    The rate of code changes or additions, which can indicate the stability of the codebase.

6. Code Review Turnaround Time

    The time it takes to review and approve/reject code changes submitted by team members.

7. Test Coverage

    The percentage of the codebase covered by automated tests.

8. Bugs Open/Closed

    The number of open and closed bugs over time, helping to assess the health of the project.

9. Release Frequency

    How often new releases or updates are deployed to production.

10. Customer Satisfaction

    Feedback from users or stakeholders about the quality and functionality of the software.

11. Effort Variance

    A comparison of the estimated effort versus the actual effort spent on a task or project.

12. Code Complexity

    Measures like cyclomatic complexity that assess the complexity of the codebase, potentially indicating areas that need refactoring.

13. Build Success Rate

    The percentage of successful builds compared to total attempts.

14. Cycle Time

    The time taken to complete a unit of work, such as a user story, task, or feature. It helps measure the efficiency of the development process.

15. Lead Time

    The time taken for a code change to move from the initiation of work (e.g., coding) to its deployment in production. It provides insights into the speed of delivery.

16. Velocity

    A metric used in Agile methodologies like Scrum to measure the rate at which a team completes work during a specific time frame, often a sprint.

17. Defect Density

    The number of defects or issues found in the software per unit of code, typically per lines of code (LOC) or function points.

18. Code Coverage

    The percentage of code that is exercised by automated tests, indicating the extent to which the codebase is tested.

19. Deployment Frequency

    How often new releases or updates are deployed to production, indicating the organization's ability to deliver changes.

20. Change Failure Rate

    The percentage of code changes that result in defects or issues after deployment, reflecting the stability of the release process.

21. Time to Restore Service

    The time taken to restore normal service after an incident or outage, measuring the efficiency of incident response.

22. Customer Satisfaction

    Feedback from users or stakeholders about the quality and functionality of the software.

23. Technical Debt

    An estimation of the effort required to address accumulated technical issues or shortcuts in the codebase.

24. Code Churn

    The rate of code changes or additions, indicating the level of activity in the codebase.

25. Code Review Turnaround Time

    The time taken to review and approve/reject code changes submitted by team members.

#### 1.1.2. Meta-Metrics

Meta-metrics, also known as `metrics about metrics`, focus on the measurement process itself. They assess the quality, accuracy, and effectiveness of the primary metrics being collected. Meta-metrics help ensure that the measurement process is reliable, consistent, and provides meaningful insights.

By monitoring and optimizing meta-metrics, organizations can ensure the accuracy, reliability, and usefulness of their primary metrics, leading to more informed decision-making and effective process improvement.

1. Data Completeness

    Measures the extent to which all required data points are being captured accurately and consistently. Incomplete data can lead to inaccurate analysis and conclusions.

2. Data Accuracy

    Assesses the correctness and reliability of the data being collected. Incorrect data can result in misleading insights and decisions.

3. Data Timeliness

    Measures how quickly data is collected and entered into the measurement system. Timely data is crucial for real-time analysis and decision-making.

4. Metric Relevance

    Evaluates whether the chosen metrics align with the goals and objectives of the measurement process. Irrelevant metrics can waste resources and lead to incorrect conclusions.

5. Metric Validity

    Determines whether the selected metrics accurately measure what they are intended to measure. Valid metrics provide meaningful insights.

6. Metric Reliability

    Reflects the consistency and stability of metric measurements over time. Unreliable metrics can lead to uncertainty and lack of trust.

7. Metric Sensitivity

    Indicates how well a metric captures variations and changes in the process being measured. Metrics should be sensitive enough to detect meaningful differences.

8. Metric Precision

    Measures the level of detail and accuracy in metric measurements. Precise metrics provide more accurate and refined insights.

9. Metric Interpretability

    Assesses how easily metric results can be understood and interpreted by stakeholders. Complex metrics can hinder effective communication.

10. Metric Bias

    Checks for any systematic errors or distortions in metric measurements. Bias can lead to skewed perceptions of performance.

11. Metric Stability

    Examines the consistency of metric measurements across different contexts and environments. Stable metrics are reliable under varying conditions.

12. Metric Overhead

    Measures the effort, time, and resources required to collect and analyze metric data. Excessive overhead can discourage the use of metrics.

13. Metric Correlation

    Analyzes the relationships between different metrics to identify dependencies and interactions that might affect interpretations.

### 1.2. Standards

Standards and guidelines provide recommendations for Software metric. These standards help organizations establish consistent and effective practices for measuring and improving software development processes.

1. ISO/IEC 15939 (Software Measurement Process)

    This international standard provides guidance on establishing a measurement process for software development and maintenance. It covers measurement framework, planning, implementation, and analysis.

2. ISO/IEC 25010 (Systems and Software Quality Requirements and Evaluation - SQuaRE)

    Part of the SQuaRE series, this standard defines a comprehensive set of quality characteristics and sub-characteristics for software products. It offers guidance on assessing and measuring software quality.

3. CMMI (Capability Maturity Model Integration)

    While not exclusively focused on metrics, CMMI provides a framework for process improvement in various domains, including software development. It includes guidance on measurement and analysis practices.

4. ISO/IEC TR 90006 (Guidance on the Application of ISO 9001:2015 to IT Service Management and Software Engineering)

    This technical report provides guidance on adapting ISO 9001 quality management principles to software engineering processes, including measurement and metrics.

5. ISO/IEC TR 20000-7 (Guidance on the Integration and Correlation of ISO/IEC 20000-1:2018 and ISO/IEC 12207:2017)

    This technical report provides guidance on integrating service management and software engineering processes, which may involve metrics alignment.

6. IEEE Standard 1061 (Software Metrics)

    This IEEE standard provides definitions and guidelines for various software metrics, helping organizations establish consistent measurement practices.

7. SEI (Software Engineering Institute) Metrics Program

    The SEI offers guidance on software measurement and metrics through various resources, including books, articles, and training.

### 1.3. Frameworks

> NOTE When choosing a framework, consider the organization's goals, methodologies, and specific needs. Remember that metrics should be chosen thoughtfully, aligned with objectives, and not used in isolation. Also, be cautious about potential unintended consequences, such as optimizing for metrics at the expense of overall quality or customer satisfaction.

1. Goal-Question-Metric (GQM) Framework

    GQM is a goal-oriented approach that helps define goals, questions, and corresponding metrics. It ensures that metrics are aligned with specific objectives and provide meaningful insights.

2. Key Performance Indicators (KPIs)

    KPIs are specific metrics that organizations use to measure progress towards strategic goals. They focus on critical success factors and are often used at higher levels of decision-making.

3. Software Engineering Institute (SEI) CMMI

    The Capability Maturity Model Integration provides a structured framework for process improvement across various domains, including software development. It includes performance measurement and metrics as a key component.

4. ISO/IEC 25010 (SQuaRE)

    This standard defines a comprehensive set of software quality attributes and their sub-characteristics. It provides a structured approach for measuring software quality and performance.

5. Agile Metrics Frameworks

    Agile methodologies have their own set of metrics frameworks, such as SAFe (Scaled Agile Framework) metrics and Disciplined Agile Delivery (DAD) metrics, which are tailored to the Agile development context.

6. Balanced Scorecard (BSC)

    While not specific to software development, BSC is a strategic performance management framework that helps organizations track and manage their overall performance using a balanced set of financial and non-financial metrics.

7. Lean Software Development Metrics

    Inspired by Lean principles, this framework focuses on minimizing waste, improving flow, and delivering value. Metrics like cycle time, lead time, and work in progress (WIP) are commonly used in this context.

8. DORA

    The DevOps Research and Assessment (DORA) framework emphasizes Four Key Metrics of DevOps related to deployment frequency, lead time, change failure rate, and time to restore service. It's geared towards improving software delivery and operations.

    > NOTE See [DORA](../articles/dora.md) for details.

9. SPACE

    The SPACE framework is a set of metrics that measure the capabilities of software development teams. The SPACE framework divides the capabilities of software development teams into five categories: satisfaction and well-being, performance, activity, collaboration and communication, and efficiency and flow.

### 1.4. Tools

Tools offer a range of capabilities, from tracking code quality and deployment metrics to monitoring application performance and user experience.

1. Jira

    A widely used project management and issue tracking tool that offers customizable dashboards and reporting features to track various metrics.

2. GitLab

    A platform that provides version control, CI/CD pipelines, and issue tracking, along with built-in metrics and analytics for software development processes.

3. GitHub

    Similar to GitLab, GitHub offers version control and issue tracking, with additional integrations and extensions for tracking Software metric.

4. Azure DevOps (formerly Visual Studio Team Services)

    A set of development tools that includes version control, CI/CD pipelines, and work tracking with built-in reporting and analytics.

5. Jenkins

    An open-source automation server that can be configured to generate various metrics related to build and deployment processes.

6. SonarQube

    A tool for continuous code quality inspection, providing metrics on code smells, bugs, vulnerabilities, and code coverage.

7. New Relic

    A monitoring and observability platform that offers insights into application performance, user experience, and infrastructure metrics.

8. Prometheus

    An open-source monitoring and alerting toolkit that specializes in collecting and displaying metrics from applications and systems.

9. Grafana

    A popular open-source dashboard and visualization platform that can integrate with various data sources, including metrics from software development processes.

10. Opsgenie

    A tool for incident management and alerting that can help measure metrics related to incident response times and resolution.

11. Datadog

    A monitoring and analytics platform that provides insights into application performance, infrastructure metrics, and logs.

12. Trello

    A visual project management tool that can be customized to track various development metrics using boards and cards.

## 2. References

- Wikipedia [software metric](https://en.wikipedia.org/wiki/Software_metric) article.
