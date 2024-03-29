# Everything as Code

Everything as Code (XaC) is a software development philosophy that treats infrastructure as code.

- [1. Category](#1-category)
  - [1.1. Infrastructure-as-Code (IaC)](#11-infrastructure-as-code-iac)
  - [1.2. Configuration-as-Code (CaC)](#12-configuration-as-code-cac)
  - [1.3. Documentation-as-Code (DaC)](#13-documentation-as-code-dac)
  - [1.4. Security-as-Code (SaC)](#14-security-as-code-sac)
  - [1.5. Compliance-as-Code (CoC)](#15-compliance-as-code-coc)
  - [1.6. Database-as-Code (DaC)](#16-database-as-code-dac)
  - [1.7. Test-as-Code (TaC)](#17-test-as-code-tac)
  - [1.8. Policy-as-Code (PaC)](#18-policy-as-code-pac)
  - [1.9. Logging-as-Code (LaC)](#19-logging-as-code-lac)
  - [1.10. Monitoring-as-Code (MaC)](#110-monitoring-as-code-mac)
  - [1.11. Network-as-Code (NaC)](#111-network-as-code-nac)
  - [1.12. Detection as code (DaC)](#112-detection-as-code-dac)
- [2. Principles](#2-principles)
- [3. Best Practice](#3-best-practice)
- [4. Terminology](#4-terminology)

## 1. Category

`as-Code` refer to different domains or aspects of software development and infrastructure management where practices have been developed to represent configurations, settings, or definitions as code.

`as-code` aim to enhance the automation, standardization, and consistency of various aspects of software development, deployment, and infrastructure management, leading to more reliable and scalable systems. As technology and practices continue to evolve, new `as-code` categories may emerge in the future.

### 1.1. Infrastructure-as-Code (IaC)

Infrastructure-as-Code (IaC) involves managing and provisioning infrastructure resources (e.g. virtual machines, networks, storage) through code, rather than using manual processes to configure devices or systems.

Tools:

Popular tools for managing infrastructure as code include `Terraform`, `AWS CloudFormation`, `Azure Resource Manager`, and `Google Cloud Deployment Manager`.

Example:

Using Terraform to create an AWS EC2 instance:

```hcl
resource "aws_instance" "example" {
  ami           = "ami-0c94855ba95c71c99"
  instance_type = "t2.micro"
}
```

### 1.2. Configuration-as-Code (CaC)

In Configuration-as-Code (CaC) application and system configurations are represented as code, treating application config resources as versioned artifacts to manage and deploy consistent configurations across different environments.

> NOTE See [configuration management](../about/configuration-management.md) for details.

Tools:

Popular tools for managing configuration as code include `Ansible`, `Puppet`, `Chef`, `SaltStack`, `Kubernetes ConfigMaps and Helm`.

Example:

Using `Ansible` to install and configure Nginx on a server:

```yaml
---
- name: Install and start nginx
  hosts: webservers
  tasks:
    - name: Install nginx
      apt:
        name: nginx
        state: present
    - name: Start nginx
      service:
        name: nginx
        state: started
```

### 1.3. Documentation-as-Code (DaC)

Documentation-as-Code (DaC) involves writing documentation as code, allowing teams to manage documentation in version-controlled repositories and automate documentation generation.

> NOTE See [docs as code](../about/docs-as-code.md) for details.

Tools:

popular tools for managing documentation as code include `Markdown`, `Sphinx`, `MkDocs`, `Asciidoctor`, `Jekyll`, and `Docusaurus`.

Example:

Using `Markdown` to write documentation as code:

```markdown
# My Project

This is the documentation for my project.

## Getting Started

To get started with my project, follow these steps:

1. Install the dependencies by running `npm install`.
2. Start the development server by running `npm start`.

## Usage

To use my project, do the following:

1. Click on the "New" button to create a new item.
2. Enter the details for the item and click "Save".
```

### 1.4. Security-as-Code (SaC)

Security-as-Code (SaC) involves expressing security policies, controls, and configurations as code, enabling security teams to manage and enforce security measures programmatically.

Tools:

Popular tools for managing security as code include `Open Policy Agent (OPA)`, `HashiCorp Sentinel`, and `AWS Config`.

Example:

Using `Open Policy Agent (OPA)` to enforce a security policy that only allows traffic from certain IP addresses:

```rego
package httpapi.authz

default allow = false

allow {
    input.method == "GET"
    input.path = ["salary", employee_id]
    input.headers["X-Forwarded-For"] == "192.0.2.146"
}
```

### 1.5. Compliance-as-Code (CoC)

Compliance-as-Code (CoC) refers to the presentation of compliance requirements to embed the core activities of compliance: prevent, detect, remediate.

Tools:

Popular tools for managing compliance as code include `InSpec`, `Chef Compliance`, and `AWS Config Rules`.

Example:

Using `InSpec` to check if a server is compliant with a certain security policy:

```ruby
control 'ssh-1' do
  impact 1.0
  title 'Server: Configure sshd_config'
  desc 'Set sshd_config options for secure access'
  describe sshd_config do
    its('PermitRootLogin') { should eq 'no' }
    its('PasswordAuthentication') { should eq 'no' }
    its('ChallengeResponseAuthentication') { should eq 'no' }
    its('KbdInteractiveAuthentication') { should eq 'no' }
  end
end
```

### 1.6. Database-as-Code (DaC)

Database-as-Code (DaC) involves representing database schema, configurations, and migrations as code.

Tools:

Popular tools for managing databases as code include `Liquibase`, `Flyway`, and `Sqitch`.

Example:

Using `Liquibase` to manage database schema changes:

```xml
<changeSet id="create_table_person" author="liquibase-docs">
    <createTable tableName="person">
        <column name="id" type="int">
            <constraints primaryKey="true" nullable="false"/>
        </column>
        <column name="firstname" type="varchar(50)"/>
        <column name="lastname" type="varchar(50)">
            <constraints nullable="false"/>
        </column>
    </createTable>
</changeSet>
```

### 1.7. Test-as-Code (TaC)

Test-as-Code (TaC) involves writing automated tests and test scenarios as code to ensure software quality and enable continuous testing in CI/CD pipelines.

> NOTE See [testing patterns](../about/software-testing.md#11-testing-patterns) for details.

Tools:

Popular tools for writing tests as code include testing frameworks such as `Selenium`, `GTest` (for C/C++), `JUnit` (for Java), `PyTest` (for Python), and `RSpec` (for Ruby).

Example:

Using `PyTest` to write a unit test for a Python function:

```python
def add(x, y):
    return x + y

def test_add():
    assert add(1, 2) == 3
```

### 1.8. Policy-as-Code (PaC)

Policy-as-Code (PaC) refers to expressing business policies, guidelines, and rules as code, allowing for consistency and centrally manage policies, and automation in policy enforcement. It is often related to governance and compliance.

Tools:

Popular tools for managing policies as code include `Open Policy Agent (OPA)`,  `Rego` (from Open Policy Agent), `HashiCorp Sentinel`, and `AWS Organizations Service Control Policies`.

Example:

Using `Sentinel` to enforce a policy that restricts the creation of AWS EC2 instances to certain regions:

```python
import "tfplan"

main = rule {
    all tfplan.resources.aws_instance as _, instances {
        all instances as _, r {
            r.applied.change.after.region in ["us-west-2", "us-east-1"]
        }
    }
}
```

### 1.9. Logging-as-Code (LaC)

Logging-as-Code (LaC) involves defining logging configurations, log formats, and log storage settings as code, making it easier to manage and maintain log systems across various components.

Tools:

Popular tools for managing logging as code include logging frameworks such as `Logback` (for Java), Python’s built-in logging module, `log4net` (for .NET), and `Elasticsearch`, `Logstash` and `Kibana` (ELK Stack).

Example:

Using `Logback` to configure logging for a Java application:

```xml
<configuration>
  <appender name="STDOUT" class="ch.qos.logback.core.ConsoleAppender">
    <encoder>
      <pattern>%d{HH:mm:ss.SSS} [%thread] %-5level %logger{36} - %msg%n</pattern>
    </encoder>
  </appender>

  <root level="debug">
    <appender-ref ref="STDOUT" />
  </root>
</configuration>
```

### 1.10. Monitoring-as-Code (MaC)

Monitoring-as-Code (MaC) focuses on representing monitoring and observability settings, alerts, and metric configurations as code, allowing teams to centrally manage and automate their monitoring practices.

Tools:

Popular tools for managing monitoring as code include monitoring solutions such as `Prometheus` and `Grafana`, `Datadog`, and `New Relic`.

Example:

Using `Prometheus` to configure monitoring for a server:

```yaml
global:
  scrape_interval: 15s
  evaluation_interval: 15s

scrape_configs:
  - job_name: 'node'
    static_configs:
      - targets: ['localhost:9100']
```

### 1.11. Network-as-Code (NaC)

Network-as-Code (NaC) involves defining and managing network infrastructure as code, allowing teams to deploy and manage network resources appling software engineering practices.

Tools:

Popular tools for managing network infrastructure as code include network automation frameworks such as `NAPALM`, `Netmiko`, and `Ansible`.

Example:

Using `NAPALM` to configure a network device:

```python
from napalm import get_network_driver

driver = get_network_driver('ios')
device = driver('192.0.2.1', 'admin', 'password')
device.open()

config = [
    'hostname myrouter',
    'interface Ethernet1',
    'description Uplink to ISP',
    'ip address 203.0.113.1 255.255.255.252'
]

device.load_merge_candidate(config=config)
device.commit_config()
device.close()
```

### 1.12. Detection as code (DaC)

Detection as code (DaC) is a security paradigm that treats threat detection as code. Detection rules are written in a structured, machine-readable format, allowing teams to apply automated threat detection and response management.

Tools:

Popular tools for managing detection rules as code include threat detection solutions such as `Sigma`, `Snort`, and `Splunk`.

Examples:

Using `Sigma` to define a detection rule for a specific type of attack:

```yaml
title: Suspicious Process Creation
status: experimental
description: Detects suspicious process creation
author: Florian Roth
logsource:
    product: windows
    service: sysmon
detection:
    selection:
        EventID: 1
        CommandLine|contains|all:
            - '-n'
            - '-e'
            - 'cmd'
    condition: selection
fields:
    - CommandLine
    - ParentCommandLine
falsepositives:
    - Unknown
level: high
```

## 2. Principles

Everything as Code (XaC) is a concept that extends the idea of Infrastructure as Code (IaC) to include various aspects of software development, deployment, and operations represented as code. While there is no standardized set of principles specifically labeled as XaC principles, the concept aligns with the principles of IaC and the general principles of software development and DevOps practices.

> NOTE XaC is a flexible concept, and its principles may be adapted and expanded based on the specific needs and goals of an organization. By adopting XaC principles, teams can foster a culture of automation, collaboration, and efficiency in software development, operations, and infrastructure management.

- Automation
  > Emphasize automation of processes wherever possible. Representing various aspects of software development, deployment, and operations as code allows for automation, reducing manual tasks and human error.

- Version Control
  > Apply version control to code representations of different components. This enables tracking changes, collaboration among team members, and the ability to roll back to previous states if needed.

- Reproducibility
  > Ensure that code-based representations are reproducible across different environments and stages of the development lifecycle. The same code should produce consistent results in different settings.

- Collaboration
  > Facilitate collaboration among teams, including developers, operations, and security, by using code repositories as a single source of truth for configurations and settings.

- Scalability
  > Design code representations to be scalable and easily adaptable to varying workloads and infrastructure requirements.

- Standardization
  > Promote standardization and consistency in configurations and settings across different components, environments, and teams.

- Continuous Integration and Continuous Deployment (CI/CD)
  > Integrate Everything as Code practices into CI/CD pipelines to automate the testing, deployment, and management of various software and infrastructure components.

- Security by Design
  > Implement security measures and best practices as part of the code-based configurations to ensure security is integrated from the beginning.

- Immutable Infrastructure
  > Treat infrastructure as immutable by updating and redeploying code-based configurations rather than making changes directly on live systems.

- Documentation
  > Maintain comprehensive and up-to-date documentation alongside code representations to facilitate understanding and maintainability.

- Testing and Validation
  > Implement automated testing and validation of code-based configurations to ensure correctness and compliance with desired outcomes.

- Continuous Improvement
  > Embrace continuous improvement by regularly reviewing and refining code-based representations based on feedback and lessons learned.

- Auditability and Compliance
  > Use code-based configurations to enhance auditability and compliance tracking, ensuring that systems meet industry regulations and internal policies.

## 3. Best Practice

Implementing Everything as Code (XaC) involves applying code-based practices to various aspects of software development, deployment, and operations.

By following best practices, organizations can benefit from the advantages of XaC, including automation, reproducibility, scalability, security, and collaboration, leading to more efficient, reliable, and maintainable software and infrastructure systems.

- Infrastructure as Code (IaC)
  > Adopt Infrastructure as Code for provisioning and managing infrastructure resources, such as virtual machines, networks, storage, and security groups. Use tools like Terraform or AWS CloudFormation to define and manage infrastructure in code.

- Configuration as Code (CaC)
  > Express application configurations and settings as code. Utilize tools like Kubernetes ConfigMaps, Helm Charts, or configuration files in version-controlled repositories to manage application settings.

- Version Control
  > Apply version control to all code representations, including infrastructure code, application configurations, and scripts. Use Git or other version control systems to track changes, collaborate, and roll back when necessary.

- Automated Testing
  > Implement automated testing for code representations to validate their correctness and ensure that code changes do not introduce issues or regressions.

- Continuous Integration and Continuous Deployment (CI/CD)
  > Integrate XaC practices into CI/CD pipelines to automate testing, deployment, and management processes. Automate the promotion of code representations through various environments.

- Immutable Infrastructure
  > Treat infrastructure as immutable by avoiding manual changes on live systems. Instead, recreate and redeploy infrastructure components using code-based configurations.

- Security as Code (SaC)
  > Incorporate security best practices into code-based representations. Use tools like Open Policy Agent (OPA) or security frameworks to enforce security policies as code.

- Documentation
  > Maintain comprehensive and up-to-date documentation alongside code representations to facilitate understanding and collaboration among team members.

- Standardization and Consistency
  > Establish coding standards and guidelines for XaC practices to ensure consistency across projects and teams.

- Compliance as Code (CoC)
  > Integrate compliance checks and validation into XaC processes to ensure that systems meet industry regulations and internal policies.

- Collaboration
  > Foster collaboration among teams, including developers, operations, security, and other stakeholders, to jointly manage and improve code representations.

- Continuous Improvement
  > Continuously review and refine code-based representations based on feedback and lessons learned. Embrace a culture of continuous improvement in XaC practices.

- Monitor and Audit
  > Implement monitoring and auditing capabilities to track changes, monitor system behavior, and ensure compliance with XaC practices.

- Infrastructure and Application as Code (IaaC)
  > Combine Infrastructure as Code and Application as Code to holistically manage both infrastructure and application components using code representations.

- Adapt to Changes
  > Stay flexible and adaptive to changes in the software development lifecycle and infrastructure requirements. XaC practices should support agility and rapid iteration.

## 4. Terminology

- Infrastructure as Code (IaC)
  > Refers to representing infrastructure resources and configurations as code, allowing for automated provisioning and management of infrastructure.

- Configuration as Code (CaC)
  > Involves expressing application and system configurations as code, enabling version-controlled and automated configuration management.

- Security as Code (SaC)
  > Focuses on representing security policies, controls, and configurations as code, enabling programmable security measures.

- Compliance as Code (CoC)
  > Involves expressing compliance requirements and checks as code, allowing for automated compliance validation.

- Test as Code (TaC)
  > Refers to writing automated tests and test scenarios as code to ensure software quality and continuous testing.

- Policy as Code (PaC)
  > Involves expressing business policies, guidelines, and rules as code, enabling automated policy enforcement.

- Logging as Code (LaC)
  > Represents logging configurations, log formats, and log storage settings as code, facilitating programmable log management.

- Monitoring as Code (MaC)
  > Focuses on representing monitoring and observability settings, alerts, and metric configurations as code.

- Database as Code (DaC)
  > Involves representing database schema, configurations, and migrations as code.

- Network as Code (NaC)
  > Refers to defining network configurations and settings using code, enabling automated network management.

- Everything as Code (XaC)
  > The overarching concept that encompasses all the `as code` practices, promoting the idea of representing various aspects of software and infrastructure as code.
