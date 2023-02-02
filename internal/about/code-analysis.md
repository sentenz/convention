# Software Analysis

Software Analysis is the process of evaluating software systems and applications to identify potential risks, improve quality and reliability, and ensure compliance with organizational policies and industry regulations.

- [1. Code Analysis](#1-code-analysis)
  - [1.1. Static Code Analysis](#11-static-code-analysis)
  - [1.2. Dynamic Code Analysis](#12-dynamic-code-analysis)
  - [1.3. Code Review](#13-code-review)
  - [1.4. Code Quality Analysis](#14-code-quality-analysis)
  - [1.5. Performance Analysis](#15-performance-analysis)
- [2. Component Analysis](#2-component-analysis)
  - [2.1. Architecture Analysis](#21-architecture-analysis)
  - [2.2. Security Analysis](#22-security-analysis)
  - [2.3. Performance Analysis](#23-performance-analysis)
  - [2.4. Functional Analysis](#24-functional-analysis)
  - [2.5. Code Quality Analysis](#25-code-quality-analysis)
  - [2.6. Dependency Analysis](#26-dependency-analysis)
- [3. Software Composition Analysis](#3-software-composition-analysis)
  - [3.1. License Compliance](#31-license-compliance)
  - [3.2. Vulnerability Management](#32-vulnerability-management)
  - [3.3. Dependency Management](#33-dependency-management)
  - [3.4. Software Bill of Materials](#34-software-bill-of-materials)
  - [3.5. Supply Chain Risk Management](#35-supply-chain-risk-management)
  - [3.6. Policy Management](#36-policy-management)
  - [3.7. Threat Intelligence](#37-threat-intelligence)
- [4. Software Quality Assurance](#4-software-quality-assurance)
- [5. Software Configuration Management](#5-software-configuration-management)
- [6. Software Testing](#6-software-testing)
- [7. Tools](#7-tools)
  - [7.1. Linter](#71-linter)
  - [7.2. Sanitizer](#72-sanitizer)
- [8. References](#8-references)

## 1. Code Analysis

Code Analysis is a process of evaluating the quality and security of software source code. It involves examining the code for potential issues, including coding errors, performance problems, and security vulnerabilities.

In modern DevSecOps environment, code analysis has galvanized the [shift left](../about/software-testing.md#40-shift-left-testing) paradigm.

### 1.1. Static Code Analysis

Static Code Analysis performs an automated analysis of source code and compiled code to identify potential coding errors, performance issues, and security vulnerabilities.

### 1.2. Dynamic Code Analysis

Dynamic Code Analysis performs an automated analysis of code as it runs to identify performance issues, memory leaks, and other problems that may not be detected through static analysis.

### 1.3. Code Review

[Code Review](../guideline/code-review-guide.md) is a manual examination of source code to identify coding errors, performance issues, and security vulnerabilities.

### 1.4. Code Quality Analysis

Code Quality Analysis performs an automated analysis of source code to identify coding patterns and practices that may impact the quality and maintainability of the code.

### 1.5. Performance Analysis

Performance Analysis performs an automated analysis of code to identify performance bottlenecks and other performance issues that may impact the performance of an application.

## 2. Component Analysis

[Component Analysis](https://owasp.org/www-community/Component_Analysis) is analysis of individual software components in order to identify and manage potential risks and improve the quality and reliability of software applications.

### 2.1. Architecture Analysis

Architecture Analysis performs an analysis of the structure and design of software components, including the relationships between components, to improve the maintainability and scalability of software applications.

### 2.2. Security Analysis

Security Analysis performs an analysis of software components to identify potential security vulnerabilities and risks, such as buffer overflows, cross-site scripting, and SQL injection.

### 2.3. Performance Analysis

Performance Analysis performs an analysis of the performance characteristics of software components, such as memory usage, execution time, and scalability, to identify opportunities for improvement.

### 2.4. Functional Analysis

Functional Analysis performs an analysis of the functional requirements and specifications of software components, including error handling, exception management, and input validation.

### 2.5. Code Quality Analysis

Code Quality Analysis performs an analysis of the quality of software components, including coding standards, maintainability, and readability, to improve the quality and reliability of software applications.

### 2.6. Dependency Analysis

Dependency Analysis performs an analysis of the relationships between components, including dependencies on other components, version compatibility, and inter-component communication, to improve the reliability and maintainability of software applications.

## 3. Software Composition Analysis

[Software Composition Analysis (SCA)](https://snyk.io/series/open-source-security/software-composition-analysis-sca/) is a type of software analysis that focuses on identifying and managing the open-source and third-party components used in software applications. Some common topics under the umbrella of SCA include:

### 3.1. License Compliance

License Compliance performs an analysis of the licenses of open-source and third-party components to ensure compliance with organizational policies and industry regulations.

### 3.2. Vulnerability Management

Vulnerability Management performs a identification of security vulnerabilities in open-source and third-party components, and management of the remediation process.

### 3.3. Dependency Management

Dependency Management performs an analysis of the relationships between components, including dependencies on other components and version compatibility, to improve the reliability and maintainability of software applications.

### 3.4. Software Bill of Materials

Software Bill of Materials (BOM) performs a generation of a comprehensive list of all components and their versions used in a software application, to support transparency and accountability.

SBOM standards are [OWASP CycloneDX](https://cyclonedx.org/) and [SPDX](https://spdx.dev/). Software Transparency is achieved through the publishing of SBOM. Evaluating SBOM standards to determine which are applicable to an organizations requirements is part of an C-SCRM strategy.

### 3.5. Supply Chain Risk Management

[Cyber Supply Chain Risk Management (C-SCRM)](https://csrc.nist.gov/projects/cyber-supply-chain-risk-management) performs an analysis of the supply chain for open-source and third-party components, including the risk posed by components from untrusted sources.

### 3.6. Policy Management

Policy Management is a management of organizational policies for the use of open-source and third-party components, including standards for license compliance, vulnerability management, and security.

### 3.7. Threat Intelligence

Threat Intelligence performs an integration of threat intelligence data to provide real-time information on emerging threats and vulnerabilities in open-source and third-party components.

## 4. Software Quality Assurance

Software Quality Assurance (SQA) performs an analysis of software applications to ensure that they meet established quality standards, including coding standards, error handling, requirements analysis, design and code reviews, testing, quality metrics analysis and documentation.

SQA is essential for ensuring the reliability and usability of software. It helps to reduce the risk of bugs and defects, improve the software development process, and increase customer satisfaction. Effective SQA helps to build software that is robust, secure, and user-friendly and that meets the needs of users and stakeholders.

## 5. Software Configuration Management

Software Configuration Management performs an analysis of the configuration of software systems, including version control, change management, and release management.

## 6. Software Testing

[Software Testing](../about/software-testing.md) performs an analysis of software applications to identify potential bugs and ensure compliance with functional and performance requirements.

## 7. Tools

### 7.1. Linter

A linter is a software tool that analyzes source code to identify and flag potential programming errors, coding standards violations, and other types of quality issues.

Commonly used linter tools are:

- ESLint - A popular JavaScript linter that supports various coding styles and helps enforce consistent coding practices.

- Pylint - A linter for Python code, designed to identify common programming errors and improve code quality.

- RuboCop - A linter for Ruby code that checks for coding style violations, security issues, and performance bottlenecks.

- Clang-Tidy - A linter for C++ code that uses Clang and LLVM libraries to identify potential coding issues and improve code quality.

- JSHint - A JavaScript linter that can be used in a variety of development environments, including web browsers and Node.js.

- golangci-lint - A linter tool for Go code, used to detect and fix coding errors, enforce coding conventions, and improve code quality in Go projects.

- Flake8 - A Python linter that combines three existing linters into a single tool: PyFlakes, McCabe, and PEP 8.

- CSSLint - A linter for CSS code that checks for coding style violations, security issues, and performance bottlenecks.

### 7.2. Sanitizer

A sanitizer is a software tool that is used to identify and remove or correct malicious or potentially dangerous content from data inputs, such as user-generated input in a web application.

Commonly used sanitizer tools are:

- HTMLPurifier - A PHP library that removes malicious code from HTML input, including XSS attacks and other types of malicious content.

- OWASP Java Encoder - A Java library that provides a comprehensive set of functions for encoding and escaping user input to prevent XSS attacks.

- Input Sanitizer - A JavaScript library that provides a simple and flexible API for sanitizing user input to prevent XSS attacks.

- Anti-Samy - An XML and XHTML sanitizer that removes malicious code from user input and ensures that the output is secure and well-formed.

- XSS-Sanitizer - A Python library that provides a simple API for sanitizing user input to prevent XSS attacks.

- Ruby Sanitizer - A Ruby library that provides a simple API for sanitizing user input, including functions for removing malicious code, encoding special characters, and removing dangerous attributes.

- sqlmap - An open-source tool that automates the process of identifying and exploiting SQL injection vulnerabilities in web applications.

Sanitizers are tools that help identify  detect bugs such as buffer overflows or accesses, dangling pointer or different types of undefined behavior at runtime and prevent security vulnerabilities in C/C++ code.

Commonly used sanitizer tools for C/C++ are:

- Address Sanitizer (ASan) - A tool that detects memory access errors, such as out-of-bounds memory accesses and use-after-free bugs, in C/C++ code.

- Undefined Behavior Sanitizer (UBSan) - A tool that detects undefined behavior, such as signed integer overflow and division by zero, in C/C++ code.

- Thread Sanitizer (TSan) - A tool that detects data races and other synchronization bugs in multithreaded C/C++ code.

- Memory Sanitizer (MSan) - A tool that detects uninitialized memory reads in C/C++ code.

- Control Flow Integrity (CFI) - A security mechanism that helps prevent code injection attacks by enforcing constraints on the flow of control in C/C++ code.

- Valgrind - A dynamic analysis tool that can be used to detect memory leaks, buffer overflows, and other types of programming errors in C/C++ code.

## 8. References

- Sentenz [Application Security Testing (AST)](../about/software-testing.md#41-application-security-testing) article.
