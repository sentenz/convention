# DORA

- [1. Category](#1-category)
  - [1.1. Deployment Frequency](#11-deployment-frequency)
  - [1.2. Lead Time for Changes](#12-lead-time-for-changes)
  - [1.3. Time to Restore Services](#13-time-to-restore-services)
  - [1.4. Change Failure Rate](#14-change-failure-rate)
- [2. Principle](#2-principle)
- [3. Best Practice](#3-best-practice)
- [4. Terminology](#4-terminology)
- [5. References](#5-references)

## 1. Category

DORA (DevOps Research and Assessment) has identified four key categories that are essential for high-performing DevOps organizations. The categories are often referred to as the [Four Key Metrics](https://cloud.google.com/blog/products/devops-sre/using-the-four-keys-to-measure-your-devops-performance) or the `DORA Metrics`.

By measuring and improving the four key metrics, organizations can achieve faster and more reliable software delivery, which is a key goal of DevOps. The DORA metrics provide a framework for organizations to assess their DevOps practices and identify areas for improvement.

### 1.1. Deployment Frequency

This category measures how often code changes are deployed to production. High-performing DevOps organizations typically deploy changes more frequently, often multiple times per day, using techniques like continuous integration and continuous deployment.

Performance metric:

- Elite
  > On-Demand (multiple deploys per day)

- High
  > Between once per day and once per week

- Medium
  > Between once per week and once per mounth

- Low
  > Between once per mounth and once every six mounths

### 1.2. Lead Time for Changes

This category measures the time it takes for code changes to go from development to production. It includes all the processes and steps involved in delivering a software change, such as coding, testing, building, and deploying. Shortening delivery lead time is a key goal of DevOps, as it enables organizations to respond faster to changing customer needs and market demands.

Performance metric:

- Elite
  > Less than one day

- High
  > Between one day and one week

- Medium
  > Between one week and one month
  
- Low
  > Between one month and six months

### 1.3. Time to Restore Services

This category measures how quickly an organization can recover from a production incident or outage. High-performing DevOps organizations have a shorter Mean Time to Recovery (MTTR), indicating that they are able to detect and resolve incidents quickly and minimize the impact on customers.

Performance metric:

- Elite
  > Less than one hour

- High
  > Less than one day

- Medium
  > Between one day and one week

- Low
  > Between one week and one month

### 1.4. Change Failure Rate

This category measures the percentage of code changes that fail in production, e.g. lead to service impairment or service outage. High-performing DevOps organizations have a lower change failure rate, indicating that they are more reliable and resilient.

Performance metric:

- Elite
  > 0%-15%

- High
  > 15%-30%

- Medium
  > 30%-45%

- Low
  > 45%-100%

## 2. Principle

DORA (DevOps Research and Assessment) has identified several principles that are essential for high-performing DevOps organizations. These principles are based on research conducted by DORA and are intended to guide organizations in adopting and implementing DevOps practices effectively.

By following these principles, organizations can adopt and implement DevOps practices effectively and achieve faster, more reliable software delivery. The principles provide a framework for organizations to create a culture of collaboration, automate their software delivery processes, measure key metrics, share knowledge, and continuously improve their practices.

- Culture
  > DevOps is a culture of collaboration and trust between development and operations teams. Organizations that foster a culture of collaboration, shared responsibility, and continuous learning are more likely to be successful in adopting DevOps practices.

- Automation
  > Automation is essential for achieving faster and more reliable software delivery. Organizations that automate their software delivery processes, including testing, building, and deployment, are able to achieve faster lead times and lower error rates.

- Measurement
  > Measurement is critical for understanding the effectiveness of DevOps practices and identifying areas for improvement. Organizations that measure key metrics like delivery lead time, deployment frequency, change failure rate, and mean time to recovery (MTTR) are better able to optimize their software delivery processes.

- Sharing
  > Sharing knowledge and information across teams is essential for DevOps success. Organizations that share information, such as metrics, code, and best practices, are able to improve collaboration and drive innovation.

- Continuous Improvement
  > DevOps is a continuous improvement process. Organizations that continually assess and optimize their software delivery processes are more likely to achieve high performance and deliver value to their customers.

## 3. Best Practice

DORA (DevOps Research and Assessment) has identified several best practices for achieving high-performing software delivery and operational performance through the adoption of DevOps practices. These best practices are based on research conducted by DORA and are intended to guide organizations in improving their DevOps practices.

By implementing these best practices, organizations can improve their DevOps practices and achieve faster, more reliable software delivery and operational performance. The best practices provide a framework for organizations to optimize their software delivery processes and foster a culture of collaboration, learning, and continuous improvement.

- Test Automation
  > Test automation is a key practice in DevOps that can help organizations achieve faster and more reliable software delivery. Automated testing can help catch errors and issues earlier in the development cycle, enabling teams to make changes more quickly and with greater confidence.

- Continuous Testing
  > Continuous testing is a practice that involves testing throughout the software development cycle, from development to production. This includes unit testing, integration testing, and other types of testing that can help catch errors and issues earlier in the development cycle.

- Deployment Automation
  > Deployment automation is a key practice in DevOps that involves automating the deployment process, from code check-in to production. This can help organizations achieve faster and more reliable software delivery.

- Loosely Coupled Architecture
  > A loosely coupled architecture is a design approach that emphasizes modular, independent components that can be easily integrated and updated. This approach can help organizations achieve greater agility and flexibility in their software delivery process.

- Empowered Teams
  > Empowering teams is a key principle in DevOps that emphasizes collaboration, shared responsibility, and continuous learning. Organizations that foster a culture of empowerment are more likely to be successful in adopting DevOps practices.

- Test Data Management
  > Test data management is a practice that involves managing the data used in testing to ensure that it is accurate, relevant, and up-to-date. This can help organizations improve the accuracy and reliability of their testing processes.

- Monitoring and Observability
  > Monitoring and observability are practices that involve tracking the performance and behavior of software systems in production. This can help organizations identify and address issues more quickly and effectively.

- Proactive Notifications
  > Proactive notifications are a practice that involves alerting teams to potential issues or errors before they become critical. This can help organizations address issues more quickly and prevent downtime or other negative impacts.

- Database Change Management
  > Database change management is a practice that involves managing changes to databases in a controlled and consistent manner. This can help organizations ensure the reliability and integrity of their databases.

- Code Maintainability
  > Code maintainability is a key factor in achieving faster and more reliable software delivery. Well-maintained code is easier to update and less prone to errors, enabling organizations to make changes more quickly and with greater confidence.

- Learning Culture
  > Fostering a culture of continuous learning, where teams are encouraged to learn new skills and share knowledge with each other, can help organizations drive innovation and improve performance.

- Version Control
  > Using version control for all code changes can help organizations track changes and collaborate more effectively.

- Test Early and Often
  > Testing early and often, including unit testing, integration testing, and automated testing, can help organizations catch errors and issues earlier in the development cycle.

- Shift Left on Security
  > Introducing security testing earlier in the development cycle, or shifting left on security, can help organizations identify and address security issues earlier and more effectively.

- ChatOps
  > Implementing ChatOps, which involves using chat tools to facilitate collaboration and communication between teams, can help organizations improve communication and collaboration.

- Trunk-Based Development
  > Using trunk-based development, where all changes are committed to a single code repository, can help organizations improve collaboration and reduce code conflicts.

- Continuous Delivery
  > Implementing continuous delivery practices, including continuous integration, continuous delivery, and continuous deployment, can help organizations achieve faster and more reliable software delivery.

## 4. Terminology

- DevOps
  > A collaborative approach to software development and delivery that emphasizes communication, collaboration, and automation between development and operations teams.

- Four Key Metrics
  > The four key metrics identified by DORA to measure software delivery and operational performance
  > delivery lead time, deployment frequency, change failure rate, and mean time to recovery (MTTR).

- High-performing DevOps organizations
  > Organizations that achieve faster and more reliable software delivery and operational performance through the adoption of DevOps practices.

- Continuous Integration (CI)
  > A practice where developers frequently integrate their code changes into a shared repository, allowing for automated testing and early error detection.

- Continuous Delivery (CD)
  > A practice where code changes are automatically built, tested, and deployed to production using a continuous integration process.

- Continuous Deployment
  > A practice where code changes are automatically deployed to production, without the need for manual approval.

- Trunk-Based Development
  > A development practice where all changes are committed to a single code repository or "trunk", which allows for easier collaboration and reduces code conflicts.

- ChatOps
  > A practice where chat tools are used to facilitate communication and collaboration between teams, and to automate certain tasks and processes.

- Shift Left
  > The practice of introducing activities like testing, security, and performance analysis earlier in the software development lifecycle, in order to catch issues earlier and improve software quality.

- Value Stream Mapping
  > A technique for visualizing and analyzing the flow of work and value through an organization's software delivery process, in order to identify opportunities for improvement.

## 5. References

- Google [devops](https://cloud.google.com/devops) article.
- Google [dora](https://www.devops-research.com/research.html) article.
- GitHub [dora](https://github.com/dora-team/fourkeys) repository.
