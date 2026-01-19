---
title: "Software Testing"
date: 2025-01-13
draft: false
description: "Comprehensive guide to software testing patterns, techniques, and best practices including TDD, BDD, and test doubles"
tags: ["testing", "quality-assurance", "tdd", "bdd"]
---

# Software Testing

Software testing is the process of evaluating a software application or system to identify any defects or issues. The purpose of software testing is to ensure that the software meets its intended requirements, is functional, reliable, and operates as expected.

- [1. Category](#1-category)
  - [1.1. Testing Patterns](#11-testing-patterns)
    - [1.1.1. Arrange, Act, Assert](#111-arrange-act-assert)
    - [1.1.2. Given-When-Then](#112-given-when-then)
    - [1.1.3. Table-Driven Testing](#113-table-driven-testing)
  - [1.2. Testing Techniques and Practices](#12-testing-techniques-and-practices)
    - [1.2.1. Test-Driven Development](#121-test-driven-development)
    - [1.2.2. Behavior-Driven Development](#122-behavior-driven-development)
    - [1.2.3. Acceptance Test-Driven Development](#123-acceptance-test-driven-development)
    - [1.2.4. Test Double](#124-test-double)
      - [1.2.4.1. Mock](#1241-mock)
      - [1.2.4.2. Fake](#1242-fake)
      - [1.2.4.3. Stub](#1243-stub)
      - [1.2.4.4. Spy](#1244-spy)
    - [1.2.5. Test Fixtures](#125-test-fixtures)
    - [1.2.6. Code Coverage](#126-code-coverage)
  - [1.3. Testing Types](#13-testing-types)
    - [1.3.1. Functional Testing](#131-functional-testing)
      - [1.3.1.1. Shift-Left Testing](#1311-shift-left-testing)
      - [1.3.1.2. System Testing](#1312-system-testing)
      - [1.3.1.3. Integration Testing](#1313-integration-testing)
      - [1.3.1.4. Unit Testing](#1314-unit-testing)
      - [1.3.1.5. Fuzz Testing](#1315-fuzz-testing)
      - [1.3.1.6. Regression Testing](#1316-regression-testing)
      - [1.3.1.7. End-to-End Testing](#1317-end-to-end-testing)
      - [1.3.1.8. Acceptance Testing](#1318-acceptance-testing)
        - [1.3.1.8.1. User Acceptance Testing](#13181-user-acceptance-testing)
        - [1.3.1.8.2. Operational Acceptance Testing](#13182-operational-acceptance-testing)
      - [1.3.1.9. Alpha Testing](#1319-alpha-testing)
      - [1.3.1.10. Beta Testing](#13110-beta-testing)
      - [1.3.1.11. Usability Testing](#13111-usability-testing)
      - [1.3.1.12. Cross-Browser Testing](#13112-cross-browser-testing)
      - [1.3.1.13. Compatibility Testing](#13113-compatibility-testing)
      - [1.3.1.14. Accessibility Testing](#13114-accessibility-testing)
      - [1.3.1.15. Sanity Testing](#13115-sanity-testing)
      - [1.3.1.16. Smoke Testing](#13116-smoke-testing)
      - [1.3.1.17. Exploratory Testing](#13117-exploratory-testing)
      - [1.3.1.18. Black Box Testing](#13118-black-box-testing)
      - [1.3.1.19. White Box Testing](#13119-white-box-testing)
      - [1.3.1.20. Gray Box Testing](#13120-gray-box-testing)
      - [1.3.1.21. A/B Testing](#13121-ab-testing)
      - [1.3.1.22. Monkey Testing](#13122-monkey-testing)
    - [1.3.2. Non-Functional Testing](#132-non-functional-testing)
      - [1.3.2.1. Security Testing](#1321-security-testing)
        - [1.3.2.1.1. Penetration Testing](#13211-penetration-testing)
        - [1.3.2.1.2. Vulnerability Scanning](#13212-vulnerability-scanning)
      - [1.3.2.2. Performance Testing](#1322-performance-testing)
        - [1.3.2.2.1. Load Testing](#13221-load-testing)
        - [1.3.2.2.2. Stress Testing](#13222-stress-testing)
        - [1.3.2.2.3. Endurance Testing](#13223-endurance-testing)
        - [1.3.2.2.4. Spike Testing](#13224-spike-testing)
        - [1.3.2.2.5. Volume Testing](#13225-volume-testing)
        - [1.3.2.2.6. Scalability Testing](#13226-scalability-testing)
        - [1.3.2.2.7. Capacity Testing](#13227-capacity-testing)
      - [1.3.2.3. Application Security Testing](#1323-application-security-testing)
        - [1.3.2.3.1. Static Application Security Testing](#13231-static-application-security-testing)
        - [1.3.2.3.2. Dynamic Application Security Testing](#13232-dynamic-application-security-testing)
        - [1.3.2.3.3. Interactive Application Security Testing](#13233-interactive-application-security-testing)
- [2. Principle](#2-principle)
- [3. Best Practice](#3-best-practice)
- [4. Terminology](#4-terminology)

## 1. Category

There are different types of software testing, including manual testing and automated testing. Manual testing involves executing test cases manually and observing the results. Automated testing involves the use of tools and scripts to automate the testing process.

Process of Software Testing:

- Planning
  > This phase involves defining the scope and objectives of testing, identifying the testing approach and techniques to be used, and determining the required resources and timelines.

- Designing
  > In this phase, test cases and test scenarios are developed based on the requirements and specifications of the software.

- Execution
  > During this phase, the developed test cases are executed to verify the functionality of the software.

- Reporting
  > The results of the testing are recorded and reported to stakeholders, including defects or issues found and recommendations for improvements.

- Retesting
  > If defects are identified, the software is retested to verify that the issues have been resolved.

### 1.1. Testing Patterns

Testing patterns are reusable techniques to common testing problems that can be used to improve the effectiveness of software testing. They allow to organize and structure test code in a way that is maintainable, scalable, and extensible.

#### 1.1.1. Arrange, Act, Assert

Arrange, Act, Assert (AAA) is a software testing pattern that provides a structured and organized way to write unit tests. It helps make the tests more readable, maintainable, and easy to understand.

Feature of AAA:

- Arrange
  > Setup the test environment by creating the necessary objects, initializing variables, and providing input data required for the test. This step ensures that the unit under test (the code being tested) has the appropriate conditions to execute the test scenario correctly.

- Act
  > Involves executing the specific method or functionality of the unit to test. This typically involves calling a method or performing some action on the unit under test using the provided input data from the `Arrange` phase.

- Assert
  > Verify the outcome of the test. Check whether the actual result of the action taken in the `Act` phase matches the expected result that you defined during the `Arrange` phase. If the outcome is as expected, the test passes, otherwise, it fails, indicating a potential problem in the code.

Example of AAA:

```python
def test_add_numbers():
    # Arrange
    num1 = 5
    num2 = 10

    # Act
    result = add_numbers(num1, num2)

    # Assert
    assert result == 15, "Addition of two numbers failed."
```

#### 1.1.2. Given-When-Then

Given-When-Then (GWT) is a software testing pattern used for structuring and writing test scenarios, particularly in behavior-driven development (BDD) and acceptance test-driven development (ATDD). GWT provides a more human-readable and expressive format for describing test cases and their expected behavior.

Features of GWT:

- Given
  > The `Given` section sets up the initial context or the preconditions for the test scenario. It describes the state of the system or the environment before the action being tested occurs. This typically includes creating objects, initializing variables, and any necessary setup steps.

- When
  > The `When` section represents the action or event that triggers the behavior being tested. It is the specific operation or method call that you want to verify for correctness.

- Then
  > The `Then` section defines the expected outcome or behavior of the system after the action in the `When` section has been performed. It includes assertions or expectations to check whether the actual result matches the expected result.

Example of GWT:

```python
def test_login_with_valid_credentials():
    # Given
    username = "admin"
    password = "password"

    # When
    response = login(username, password)

    # Then
    assert response.status_code == 200
    assert response.json()["message"] == "Login successful"
```

#### 1.1.3. Table-Driven Testing

Table-Driven Testing is a software testing technique in which test cases are organized in a tabular format, often using a spreadsheet or a list of input-output pairs. It is particularly useful for multiple similar test cases that can be represented in a systematic and concise manner. This approach is commonly used for testing functions or methods that take a set of input values and produce corresponding output values.

Table-Driven Testing separates the test case logic from the test code, making it easier to add, modify or remove test cases without changing the test implementation. It promotes maintainability and reduces duplication of test code.

> NOTE It's essential to strike a balance between using `Table-Driven Testing` and other testing techniques. While it works well for certain scenarios, not all test cases may fit neatly into a table format. Combining `Table-Driven Testing` with other testing patterns like `Given-When-Then` or `AAA` can provide a comprehensive and flexible testing strategy.

Feature of Table-Driven Testing:

- Consitency
  > Concise and readable representation of test cases and  test coverage.

- Maintenability
  > Easy to add or modify test cases without affecting the test implementation.

- Clarity
  > Simplifies the process of generating test data for a wide range of scenarios.

Example of Table-Driven Testing:

```go
func TestPercent(t *testing.T) {
  t.Parallel()

  type in struct {
    percent float64
    value   float64
  }

  type want struct {
    value float64
    err   error
  }

  tests := []struct {
    name string
    in   in
    want want
  }{
    {
      name: "valid positive input",
      in: in{
        percent: 25,
        value:   100,
      },
      want: want{
        value: 25,
        err:   nil,
      },
    },
    {
      name: "valid nagative input",
      in: in{
        percent: 50,
        value:   -200,
      },
      want: want{
        value: -100,
        err:   nil,
      },
    },
    {
      name: "invalid percentage",
      in: in{
        percent: 150,
        value:   100,
      },
      want: want{
        value: 0.0,
        err:   errors.New(out of the range),
      },
    },
  }

  for _, tt := range tests {
    t.Run(tt.name, func(t *testing.T) {
      got, err := percent.Percent(tt.in.percent, tt.in.value)
      if !errors.Is(err, tt.want.err) {
        t.Errorf("Percent() error = %v, want err %v", err, tt.want.err)
      }
      if !cmp.Equal(got, tt.want.value) {
        t.Errorf("Percent(%+v) = %v, want %v", tt.in, got, tt.want.value)
      }
    })
  }
}
```

> NOTE The `cmp` package is designed for testing, rather than production use. As such, it may panic when it suspects that a comparison is performed incorrectly to provide instruction to users on how to improve the test to be less brittle. Given cmp’s propensity towards panicking, it makes it unsuitable for code that is used in production as a spurious panic may be fatal.

### 1.2. Testing Techniques and Practices

#### 1.2.1. Test-Driven Development

Test-Driven Development (TDD) is a software development process in which test cases are written before any code is written. The idea behind TDD is to ensure that code is thoroughly tested and meets requirements before it is implemented, reducing the likelihood of defects and improving the overall quality of the software.

Concept of TDD:

- Write a test
  > The developer writes a test case for the functionality they want to implement, with the expectation that the test will fail because the code has not yet been written.

- Write the code
  > The developer writes the code to make the test pass. This is typically done in small, incremental steps, with each step building on the previous one.

- Run the test
  > The developer runs the test to ensure that it passes.

- Refactor the code
  > Once the test passes, the developer can refactor the code as needed to improve its design, readability, or performance.

- Repeat
  > The process is repeated for each new functionality or feature that is added to the software.

Benefits of TDD:

- Improved code quality
  > Because tests are written before the code, TDD helps ensure that the code meets requirements and is thoroughly tested.

- Faster feedback loop
  > TDD provides fast feedback on the quality of the code, allowing developers to quickly identify and fix issues.

- Reduced time and cost
  > By catching defects early in the development process, TDD can reduce the time and cost of fixing defects later on.

- Encourages better design
  > TDD encourages developers to write code that is modular, testable, and maintainable, leading to better overall software design.

#### 1.2.2. Behavior-Driven Development

Behavior-Driven Development (BDD) is a software development approach that focuses on defining the behavior of a system through the use of concrete examples expressed in natural language. It is a collaborative process that involves developers, testers, and business stakeholders working together to ensure that the system is being developed to meet the needs of its users.

Key concepts of BDD:

- User Stories
  > BDD starts with user stories, which are written in a specific format that describes the expected behavior of the system from the user's perspective.

- Examples
  > Examples are used to illustrate the behavior of the system, and they are written in natural language using a framework like Gherkin.

- Scenarios
  > Scenarios are the specific tests that are derived from the user stories and examples. They are used to ensure that the system is behaving as expected.

- Automation
  > BDD encourages the use of automation to ensure that the scenarios are executed consistently and efficiently.

- Collaboration
  > BDD is a collaborative process that involves developers, testers, and business stakeholders working together to ensure that the system is being developed to meet the needs of its users.

#### 1.2.3. Acceptance Test-Driven Development

Acceptance Test-Driven Development (ATDD) is a software development approach that aims to ensure that the software meets the customer's requirements and expectations by defining, automating, and executing acceptance tests early in the development cycle.

ATDD is an extension of Test-Driven Development (TDD) and is focused on defining and automating acceptance tests before implementing the code. The goal of ATDD is to ensure that the software satisfies the customer's acceptance criteria and to prevent defects by catching them early in the development cycle.

Concept of ATDD:

- Collaborate with stakeholders
  > The development team collaborates with the customer or product owner to define the acceptance criteria for the software.

- Define acceptance tests
  > The team defines acceptance tests based on the acceptance criteria, using a behavior-driven development (BDD) approach.

- Automate acceptance tests
  > The team automates the acceptance tests using a testing framework, such as Selenium or Cucumber.

- Implement code
  > The team implements the code to meet the acceptance criteria and passes the automated acceptance tests.

- Repeat
  > The team repeats this process for each new requirement or change in requirements.

#### 1.2.4. Test Double

Test Double is a concept from software testing and is used in the context of writing unit tests. It refers to a type of test-specific object that is used to replace a real component or collaborator within a test scenario. The purpose of using Test Doubles is to isolate the unit being tested from its dependencies or collaborators, ensuring that the test evaluates only the behavior of the unit itself.

By replacing real dependencies with Test Doubles, developers can simulate the behavior of those dependencies and create controlled testing environments. This allows for focused unit testing without the need to involve external systems or actual implementations.

##### 1.2.4.1. Mock

A mock is a Test Double that simulates the behavior of a real object and allows testers to set specific expectations and verify interactions with the unit under test.

Mocks can be used to simulate the behavior of external dependencies, such as a database or a web service, during testing, without actually executing any real logic. Mocks can be programmed to expect certain interactions with the dependencies, such as method calls or data requests, and can raise an error if those interactions do not occur as expected. This allows developers to ensure that their code is properly interacting with its dependencies, and can help catch errors or issues early in the development process.

##### 1.2.4.2. Fake

A fake is a simplified implementation of a real object, often used when the real implementation is too complex or time-consuming for testing.

##### 1.2.4.3. Stub

A stub is a simplified version of a real object that provides predefined responses to method calls. Stubs are used to return specific values to test certain scenarios.

##### 1.2.4.4. Spy

A spy is a type of Test Double that records the interactions between the unit under test and its collaborators. It allows testers to observe the behavior of the unit more closely.

#### 1.2.5. Test Fixtures

Test fixtures are a collection of setup tasks, data, and environment configuration that are used to prepare the system under test for testing. They are used in automated testing to ensure that the system under test is in a consistent and known state before executing each test.

Test Fixtures can include:

- Setup and Teardown scripts
  > These scripts are used to prepare the system under test for testing and to clean up after testing is complete.

- Test data
  > Test data is used to populate the system under test with data that will be used in the test.

- Test environment configuration
  > The test environment configuration is used to set up the environment in which the test will run, such as configuring the database, server, or other systems that the system under test interacts with.

#### 1.2.6. Code Coverage

Code coverage is a measure of how much of the source code of a software application is executed during testing. It is used to determine the effectiveness of testing and to identify any gaps in the test cases. Code coverage is usually expressed as a percentage of the total lines of code in the application.

Code coverage tools can be used to generate reports that show the percentage of code that was covered during testing, as well as highlighting any untested code.

Types of Code Coverage:

- Statement Coverage
  > This measures the percentage of statements in the source code that are executed during testing.

- Branch Coverage
  > This measures the percentage of decision points (such as if/else statements) that are executed during testing.

- Function Coverage
  > This measures the percentage of functions in the source code that are executed during testing.

- Condition Coverage
  > This measures the percentage of Boolean expressions (such as `if x > 0`) that are executed during testing.

### 1.3. Testing Types

#### 1.3.1. Functional Testing

Functional testing is a type of software testing that evaluates the individual components or modules of a system to ensure that they are working as expected and that they meet the specified requirements. The purpose of functional testing is to ensure that the application behaves as expected and meets the specified requirements.

Functional testing can be performed:

- Unit Testing
  > This involves testing individual units of code to ensure that they are working correctly and that they meet the specified requirements.

- Integration Testing
  > This involves testing the integration points between different components of the system to ensure that they are communicating correctly and functioning as expected.

- Regression Testing
  > This involves testing the system after a change or update has been made to ensure that existing functionality has not been affected.

- User Acceptance Testing
  > This involves testing the system with a group of end-users or customers to ensure that it meets their needs and that it is easy to use.

- Boundary Value Analysis
  > This involves testing the system with values that are at the boundaries of the specified requirements to ensure that it is handling these values correctly.

- Equivalence Partitioning
  > This involves dividing the input data into different equivalence classes and testing the system with representative values from each class to ensure that it is handling the input data correctly.

##### 1.3.1.1. Shift-Left Testing

Shift-left testing is an approach to software testing where testing activities are moved earlier in the software development life cycle. This approach emphasizes the importance of identifying and addressing defects as early as possible in the development process, rather than waiting until later stages such as system or acceptance testing.

In a traditional software development model, testing is typically performed after the development phase, once the code has been completed. However, in a shift-left testing model, testing activities such as unit testing, integration testing, and functional testing are performed much earlier in the development process, often alongside the coding process.

By moving testing activities earlier in the development process, shift-left testing aims to identify and fix defects earlier, before they become more difficult and expensive to fix. This can ultimately result in higher-quality software that is delivered more quickly and at a lower cost.

Shift-left testing can be achieved through the use of automation tools and techniques such as continuous integration and continuous testing. By automating testing activities and integrating them into the development process, developers can identify and address defects in real time, as they are introduced into the code. This can help ensure that defects are caught early, before they can have a negative impact on the software or the user experience.

Shift-left testing can also help to promote a culture of quality within development teams, by emphasizing the importance of testing and quality assurance throughout the entire software development life cycle.

##### 1.3.1.2. System Testing

System testing is a type of software testing that is performed on a complete and integrated system to evaluate its compliance with the specified requirements. The objective of system testing is to ensure that the system meets the functional and non-functional requirements and works as expected in a real-world environment.

Benefits of System Testing:

- Scope
  > System testing covers the entire system and its components, including hardware, software, and networks.

- Test Environment
  > System testing is typically performed in a test environment that is similar to the production environment to ensure that the system performs as expected in a real-world environment.

- Test Types
  > System testing can involve a variety of testing types, including functional testing, performance testing, security testing, usability testing, and others, depending on the system requirements.

- Test Cases
  > System testing requires a comprehensive set of test cases that cover all the system requirements and use cases.

- Test Execution
  > System testing involves executing the test cases and analyzing the results to identify defects and issues.

- Defect Management
  > System testing requires effective defect management to track, prioritize, and resolve the defects and issues identified during testing.

- Acceptance Criteria
  > System testing includes establishing acceptance criteria to determine when the system is ready for release to production.

##### 1.3.1.3. Integration Testing

Integration testing is a type of software testing that verifies the interactions between different software components or modules to ensure that they function correctly as a group. The purpose of integration testing is to detect and resolve any issues or defects that arise due to the interactions between the components.

During integration testing, test cases are designed to test the interactions between different modules and their interfaces. The test cases should be designed to identify any errors or issues that may arise from these interactions, such as data transfer errors, incorrect function calls, and other types of interface errors.

Integration testing can be performed:

- Top-Down Integration Testing
  > This approach tests the high-level modules first, and then gradually adds lower-level modules and sub-modules for testing.

- Bottom-Up Integration Testing
  > This approach tests the lower-level modules first, and then gradually adds higher-level modules for testing.

- Big Bang Integration Testing
  > This approach tests all the modules of an application together as a whole.

- Sandwich Integration Testing
  > This approach combines the top-down and bottom-up integration testing approaches.

##### 1.3.1.4. Unit Testing

Unit testing is a software testing technique where individual units or components of a software application are tested in isolation from the rest of the system to ensure that they meet the specified requirements and function as expected. The objective of unit testing is to detect and isolate defects early in the development cycle, before the code is integrated with other components or systems.

Unit testing can be performed:

- Test-driven development (TDD)
  > This involves writing the tests for the code before actually writing the code itself. The tests are used as a reference for writing the code and to ensure that the code meets the expected requirements.

- White-box testing
  > This involves testing the internal structures of the software, such as the code and the algorithms used, to ensure that they are functioning correctly.

- Black-box testing
  > This involves testing the external behavior of the software, without looking at its internal structures, to ensure that it is functioning correctly as per the requirements.

- Code coverage analysis
  > This involves measuring the extent to which the code has been tested, by analyzing the number of lines of code that have been executed during testing.

- Mutation testing
  > This involves introducing artificial faults or mutations into the code, to ensure that the tests are able to detect and report such faults.

Benefits of Unit Testing:

- Scope
  > Unit testing focuses on testing individual units or components of the software application, such as functions, classes, or methods.

- Test Environment
  > Unit testing is typically performed in a development environment that simulates the production environment, but with the necessary tools and frameworks to support unit testing.

- Test Types
  > Unit testing can involve a variety of testing types, such as functional testing, boundary testing, and exception testing, depending on the nature of the unit being tested.

- Test Frameworks
  > Unit testing requires a test framework, such as GTest, JUnit, NUnit, or pytest, to define test cases, execute tests, and report results.

- Test Cases
  > Unit testing requires a comprehensive set of test cases that cover all the possible scenarios and outcomes for the unit being tested.

- Test Execution
  > Unit testing involves executing the test cases and analyzing the results to identify defects and issues.

- Test Automation
  > Unit testing can be automated using continuous pipeline tools such as Jenkins or Travis CI to improve efficiency and reliability.

##### 1.3.1.5. Fuzz Testing

Fuzz testing, also known as fuzzing, is a type of software testing that involves feeding invalid, unexpected, or random data inputs to a software program to detect vulnerabilities, crashes, and other errors.

Fuzz testing can be performed manually or with the use of automated tools, which generate and feed random inputs to the software under test. The goal of fuzz testing is to uncover vulnerabilities and edge cases that might not be discovered through traditional testing methods, such as unit testing and integration testing.

Benefits of Fuzz Testing:

- Comprehensive coverage
  > Fuzz testing can provide comprehensive test coverage, as it can explore a wide range of potential input combinations that might be difficult to test manually.

- Detection of edge cases
  > Fuzz testing can help to detect edge cases and unexpected input combinations that might cause the software to crash or behave unpredictably.

- Early detection of vulnerabilities
  > Fuzz testing can help to identify vulnerabilities early in the software development life cycle, which can save time and money in the long run.

- Automation
  > Fuzz testing can be automated, which can save time and effort compared to manual testing.

- Scalability
  > Fuzz testing can be scaled up to test large and complex software systems, making it suitable for testing enterprise-grade applications.

##### 1.3.1.6. Regression Testing

Regression testing is a type of software testing that verifies that changes or modifications made to the software application do not impact the existing functionality of the application. It involves re-testing the application after a change has been made to ensure that the application still performs as expected and that new changes do not introduce any new bugs or issues.

Regression testing is important to ensure that the quality of the software application is maintained throughout the development lifecycle. It is typically performed after a change has been made to the application, such as a bug fix, new feature implementation, or software upgrade.

##### 1.3.1.7. End-to-End Testing

End-to-End testing is a type of software testing that involves testing the entire software application from start to finish, simulating a real-world scenario. The purpose of end-to-end testing is to ensure that all components of the application are working together correctly and that the application meets its intended requirements.

End-to-End testing can be performed:

- Scenario Testing
  > This involves testing the system under different scenarios and user workflows to ensure that all components are working together as expected.

- Integration Testing
  > This involves testing the integration points between different components of the system to ensure that they are communicating correctly and functioning as expected.

- Data Validation
  > This involves validating the data that flows through the system to ensure that it is being processed correctly and accurately.

- User Interface Testing
  > This involves testing the user interface of the system to ensure that it is easy to use and that all functions and features are working correctly.

- Performance Testing
  > This involves testing the performance of the system under different load and stress conditions to ensure that it can handle the expected level of user traffic.

- Security Testing
  > This involves testing the security of the system to ensure that it is protected against potential threats or attacks.

##### 1.3.1.8. Acceptance Testing

Acceptance Testing is a type of software testing that is conducted to determine whether the software meets the specified requirements and is acceptable for delivery to the end-users or stakeholders. The primary objective of acceptance testing is to ensure that the software fulfills the business requirements and functions as expected in the real-world environment.

###### 1.3.1.8.1. User Acceptance Testing

User Acceptance Testing (UAT) is a type of acceptance testing that is performed by the end-users or customers of the software application. The purpose of UAT is to determine whether the software meets the needs and requirements of the end-users and is ready for release.

UAT typically involves creating a set of test cases that cover the functional and non-functional requirements of the software. These test cases are designed to simulate real-world scenarios and usage patterns to ensure that the software meets the needs of the end-users or customers.

UAT is usually performed in a controlled environment, such as a test lab or staging environment, and is often supervised by a dedicated testing team or a representative from the software development team. The testing team or representative provides guidance and support to the end-users or customers during the testing process, ensuring that they understand how to perform the tests and how to report any issues or defects that they encounter.

###### 1.3.1.8.2. Operational Acceptance Testing

Operational Acceptance Testing (OAT) evaluates whether the software is ready to be deployed and operated in the production environment. It focuses on verifying that all non-functional aspects, such as installation, configuration, and maintenance procedures, are well-documented and successfully executed.

##### 1.3.1.9. Alpha Testing

Alpha testing is a type of software testing that is performed by the development team or a group of testers in a lab environment before the software is released to the general public. The purpose of alpha testing is to identify any major issues or bugs that may still exist in the software and to ensure that it is stable enough to move on to the next stage of testing.

Key characteristics of alpha testing:

- Limited audience
  > Alpha testing is typically conducted with a limited group of testers, who are either members of the development team or selected testers.

- Controlled environment
  > Alpha testing is conducted in a controlled environment, such as a lab or a staging environment, where the testers can closely monitor the software and report any issues that arise.

- Early stage testing
  > Alpha testing is one of the earliest stages of testing and is usually performed after the initial development of the software is complete.

- Functional testing
  > Alpha testing focuses on functional testing, which means that the testers are mainly looking for any major issues or bugs that may still exist in the software.

- Collaborative approach
  > Alpha testing involves a collaborative approach, with the testers working closely with the development team to ensure that any issues are quickly identified and resolved.

- Not public-facing
  > Alpha testing is not public-facing, which means that the software is not yet available to the general public and is only being tested internally by the development team or a selected group of testers.

##### 1.3.1.10. Beta Testing

Beta testing is a type of software testing that involves releasing a pre-release version of the software, known as a beta version, to a limited group of external users or customers. The purpose of beta testing is to get feedback from real users on the usability, functionality, and overall quality of the software before it is released to the general public.

Different types of beta testing include open beta testing, closed beta testing, and hybrid beta testing, each with their own approach to releasing the beta version of the software to external users.

Key characteristics of beta testing:

- Limited release
  > Beta testing is typically conducted on a limited scale, with the beta version of the software only being released to a small group of external users or customers.

- Real-world testing
  > Beta testing provides an opportunity for real-world testing of the software in a live environment, with real users testing the software in their own settings and use cases.

- Feedback collection
  > The goal of beta testing is to gather feedback from users on the usability, functionality, and overall quality of the software. This feedback is used to identify and fix issues and improve the user experience before the final release.

- Time-bound
  > Beta testing is usually time-bound, with a specific duration for the testing period. This allows for efficient collection of feedback and timely implementation of fixes before the final release.

##### 1.3.1.11. Usability Testing

Usability testing is a type of testing that focuses on evaluating how user-friendly and intuitive the software or application is for its intended users. The goal of usability testing is to identify any usability issues and areas of improvement in the user interface (UI) and user experience (UX).

Usability testing involves recruiting a group of representative users who match the target audience of the software. The testers are given a set of tasks to perform using the software or application, and their interactions with the software are observed and recorded. The testers are asked to provide feedback on the ease of use, clarity of instructions, and overall satisfaction with the software.

Usability testing can be performed at different stages of the software development lifecycle, including during the design phase, after the development phase, and during the post-production phase. The feedback collected during usability testing is used to make design changes and improvements to the software.

##### 1.3.1.12. Cross-Browser Testing

Cross-browser testing is a type of software testing that focuses on verifying the compatibility and functionality of a web application or website across different web browsers and their versions. The purpose of cross-browser testing is to ensure that the web application works consistently and without any errors across different browsers and platforms, and that users have a consistent experience irrespective of the browser or device they are using.

During cross-browser testing, a variety of browsers are used, including Google Chrome, Mozilla Firefox, Safari, Microsoft Edge, and Internet Explorer. The web application or website is tested in different versions of each browser to ensure that it works well with older and newer versions of the browsers. The testing includes verifying that the UI elements, layouts, and features of the web application are consistent across different browsers.

##### 1.3.1.13. Compatibility Testing

Compatibility testing is a type of software testing that focuses on verifying whether an application or system works as expected across different environments, platforms, and devices. The purpose of compatibility testing is to ensure that the application is compatible with various hardware, software, and network configurations and to identify any compatibility issues that may affect the performance or functionality of the application.

Compatibility testing includes testing the application or system on different operating systems, hardware configurations, web browsers, mobile devices, and network environments. The testing process involves verifying that the application works seamlessly across different combinations of these environments and that it is not affected by factors such as screen resolution, memory, processor speed, or network bandwidth.

##### 1.3.1.14. Accessibility Testing

Accessibility testing is a type of software testing that is performed to ensure that an application or system can be easily used by people with disabilities. The goal of accessibility testing is to ensure that the software is compliant with accessibility standards and guidelines, such as the Web Content Accessibility Guidelines (WCAG) issued by the World Wide Web Consortium (W3C).

Accessibility testing can be performed:

- Keyboard-only navigation testing
  > This involves testing the application using only the keyboard to ensure that all functionality can be accessed without the use of a mouse.

- Screen reader testing
  > This involves testing the application with a screen reader to ensure that all content and functionality is accessible to users who are blind or have low vision.

- Color contrast testing
  > This involves testing the application to ensure that there is sufficient contrast between text and background colors for users with low vision.

- Focus testing
  > This involves testing the application to ensure that keyboard focus is properly indicated and that users can easily navigate between elements using the keyboard.

- ARIA attribute testing
  > This involves testing the application to ensure that it is properly utilizing Accessible Rich Internet Applications (ARIA) attributes to provide additional context and functionality for users with disabilities.

- Usability testing with users with disabilities
  > This involves testing the application with users who have disabilities to gather feedback on its accessibility and usability.

##### 1.3.1.15. Sanity Testing

Sanity testing, also known as quick checking or subset testing, is a type of software testing that is performed to ensure that the application or system is stable and functional enough for further testing. The purpose of sanity testing is to quickly evaluate whether the software is working as expected and whether there are any major defects or issues that need to be addressed before proceeding with more comprehensive testing.

Sanity testing is typically performed after a major change or update to the software or after a series of tests have been run on the software. The process involves executing a set of basic and critical test cases that cover the core functionality of the application. These test cases are designed to identify any major issues or defects that might prevent further testing from being carried out.

##### 1.3.1.16. Smoke Testing

Smoke testing, also known as build verification testing, is a type of software testing that is used to ensure that the basic and critical functionalities of an application or system are working as expected after a new build or release. The purpose of smoke testing is to verify that the application is stable and functional enough to proceed with further testing.

Smoke testing is usually performed after a new build or release of software is created. The process involves executing a series of pre-defined test cases that cover the most important and critical features of the application. These test cases are designed to identify any major issues or defects that might prevent further testing from being carried out.

##### 1.3.1.17. Exploratory Testing

Exploratory testing is a type of software testing that involves simultaneous test design, execution, and learning. In other words, the tester explores the software product in an unstructured way, experimenting with different inputs, outputs, and configurations, to uncover potential issues and gain a deeper understanding of the software's behavior and capabilities.

Key characteristics of exploratory testing:

- Creativity and intuition
  > Exploratory testing requires creativity and intuition on the part of the tester, who must be able to identify potential issues and devise new tests on the fly.

- Ad-hoc testing
  > Exploratory testing is an ad-hoc approach to testing, meaning that there is no predefined test plan or test case.

- Test design and execution
  > In exploratory testing, test design and execution are performed simultaneously, with the tester creating and executing tests as they explore the software.

- Learning and discovery
  > Exploratory testing is focused on learning and discovery, with the tester seeking to uncover potential issues and gain a deeper understanding of the software's behavior and capabilities.

- Documentation
  > Although exploratory testing is an ad-hoc approach, it is still important to document the tests that are performed and any issues that are uncovered, in order to aid in future testing and development efforts.

##### 1.3.1.18. Black Box Testing

Black box testing is a type of software testing where the tester does not have access to the internal workings of the system or application being tested. In black box testing, the tester focuses solely on the inputs and outputs of the system, without any knowledge of the underlying code, algorithms, or architecture.

Key characteristics of black box testing:

- No knowledge of internal code
  > The tester has no knowledge of the internal workings of the software being tested. They only know what the software is supposed to do and how it should behave.

- Emphasis on requirements and specifications
  > Black box testing is focused on ensuring that the software meets the specified requirements and adheres to the stated specifications.

- Inputs and outputs
  > The tester focuses on the inputs to the software and the corresponding outputs, verifying that the outputs are correct for the given inputs.

- Multiple test scenarios
  > Black box testing involves testing the software with multiple test scenarios, including normal and abnormal inputs and usage patterns.

- Verification of functionality
  > Black box testing is focused on verifying the functionality of the software, including its ability to handle errors and exceptions.

- User-centric approach
  > Black box testing is focused on ensuring that the software meets the needs and expectations of the end user, without any bias towards the internal workings of the software.

##### 1.3.1.19. White Box Testing

White Box Testing is a type of software testing that involves examining the internal workings of a software application to ensure that it is functioning as intended. Unlike black box testing, which only evaluates the application's external behavior, white box testing involves examining the application's source code, architecture, and design to ensure that it meets the necessary quality standards.

Key characteristics of white box testing:

- Code-based testing
  > White box testing is code-based, meaning that the tester has access to the application's source code and can examine it for potential issues.

- Knowledge of the system
  > White box testing requires a deep understanding of the system architecture and design, as well as the programming languages and technologies used to build the application.

- Techniques and methods
  > White box testing uses a variety of techniques and methods to evaluate the software, including unit testing, integration testing, and code reviews.

- Focus on code coverage
  > White box testing is often focused on achieving a high level of code coverage, meaning that all parts of the application's source code are tested to ensure that they are functioning correctly.

- Debugging and troubleshooting
  > White box testing is often used for debugging and troubleshooting, as it allows testers to identify and isolate potential issues at the code level.

##### 1.3.1.20. Gray Box Testing

Gray box testing is a type of software testing that combines elements of both black box and white box testing. In gray box testing, the tester has partial knowledge of the internal workings of the system or application being tested, but does not have full access to the source code or underlying architecture.

Key characteristics of gray box testing:

- Partial knowledge
  > The tester has some knowledge of the internal workings of the system, such as the design and architecture, but not complete knowledge of the code.

- Test design and execution
  > Gray box testing involves both test design and execution, with the tester using their partial knowledge to create more effective tests.

- Combination of techniques
  > Gray box testing combines techniques from both black box and white box testing, leveraging the advantages of each to create a more comprehensive testing approach.

- Focused testing
  > Gray box testing is typically more focused than black box testing, as the tester has some knowledge of the internal workings of the system and can target specific areas for testing.

##### 1.3.1.21. A/B Testing

A/B testing is a type of testing that involves comparing two different versions of a product or service to determine which one performs better in terms of user engagement or other key metrics. In A/B testing, a group of users is randomly assigned to one of two groups, with each group being presented with a different version of the product or service. The performance of each version is then measured and compared to determine which one is more effective.

Key characteristics of A/B testing:

- Randomization
  > A/B testing requires randomization to ensure that the results are not biased by factors such as user demographics or behavior.

- Control and treatment groups
  > A/B testing involves the use of control and treatment groups, with one group being presented with the current version of the product or service (control) and the other group being presented with a modified version (treatment).

- Key metrics
  > A/B testing is focused on measuring key metrics such as click-through rates, conversion rates, or engagement rates to determine which version of the product or service is more effective.

- Statistical significance
  > A/B testing requires statistical significance to ensure that the differences between the two versions are not due to chance.

Iterative testing
  > A/B testing is often conducted iteratively, with multiple rounds of testing and refinement to improve the performance of the product or service over time.

##### 1.3.1.22. Monkey Testing

Monkey testing is a type of software testing that involves randomly generating inputs and feeding them to an application, with the goal of causing it to crash or produce unexpected behavior.

The term `monkey` refers to the idea that the inputs are generated randomly, like a monkey typing on a keyboard.

Key characteristics of monkey testing:

- Randomness
  > Monkey testing is random in nature, with inputs generated without any specific test plan or test case.

- Automated
  > Monkey testing is typically automated, with software tools generating the inputs and monitoring the application for crashes or errors.

- Exploratory
  > Monkey testing is exploratory, with the goal of uncovering potential issues or weaknesses in the application.

- Chaos Engineering
  > Monkey testing is sometimes considered a form of chaos engineering, which involves intentionally injecting failures into a system to test its resiliency and ability to recover.

#### 1.3.2. Non-Functional Testing

Non-functional testing is a type of software testing that focuses on testing the non-functional aspects of the software application, such as performance, scalability, reliability, usability, and security. The purpose of non-functional testing is to ensure that the system or application meets the non-functional requirements and performance goals specified in the project requirements.

##### 1.3.2.1. Security Testing

Security testing is a type of software testing that is focused on evaluating the security of an application or system. The goal of security testing is to identify any vulnerabilities or weaknesses in the system and to determine whether the system is protected against potential attacks or threats.

###### 1.3.2.1.1. Penetration Testing

This involves simulating a real-world attack on the system to identify any vulnerabilities or weaknesses that could be exploited by attackers.

###### 1.3.2.1.2. Vulnerability Scanning

Identifying potential vulnerabilities within the software. This involves using automated tools and manual techniques to scan the software for known vulnerabilities and weaknesses. It helps in identifying common security issues such as outdated software, misconfigurations, and insecure coding practices.

##### 1.3.2.2. Performance Testing

Performance testing is a type of non-functional testing that is focused on evaluating how well a system or application performs under a specific workload or user load. The goal of performance testing is to identify any performance-related issues or bottlenecks in the system and to determine whether the system can handle the expected user load.

###### 1.3.2.2.1. Load Testing

Load testing is a type of software testing that evaluates the system's ability to handle a specific load or volume of users, requests, or transactions. The goal of load testing is to identify performance bottlenecks and other issues related to system scalability and stability under high load conditions.

###### 1.3.2.2.2. Stress Testing

This involves testing the system beyond its normal operational capacity to determine its breaking point or to identify potential failure points.

###### 1.3.2.2.3. Endurance Testing

This involves testing the system under a sustained workload to evaluate its ability to handle the load over an extended period.

###### 1.3.2.2.4. Spike Testing

This involves testing the system's ability to handle sudden and large increases in user traffic.

###### 1.3.2.2.5. Volume Testing

This involves testing the system's ability to handle large volumes of data.

###### 1.3.2.2.6. Scalability Testing

This involves testing the system's ability to scale up or down to handle changing user loads or resource demands.

###### 1.3.2.2.7. Capacity Testing

This involves testing the system's ability to handle a specific number of users or transactions within a defined period.

##### 1.3.2.3. Application Security Testing

Application security testing is a type of software testing that focuses on identifying and addressing security vulnerabilities and weaknesses in an application. The goal of application security testing is to ensure that an application is secure from potential attacks and threats, such as data breaches, unauthorized access, or theft.

###### 1.3.2.3.1. Static Application Security Testing

Static Application Security Testing (SAST) is a type of application security testing that analyzes the source code of an application to detect security vulnerabilities and coding errors. SAST tools scan the application's source code or compiled binary code to identify potential security flaws, such as SQL injection, cross-site scripting (XSS), buffer overflows, and other types of vulnerabilities.

Features of SAST:

- Code Analysis
  > SAST tools analyze the source code of an application to identify security vulnerabilities and coding errors.

- Early Detection
  > SAST testing can detect security flaws early in the development process, before the application is deployed to production.

- Customizable Rules
  > SAST tools allow users to customize the rules and policies used to detect security flaws, based on their specific requirements.

- Integration
  > SAST tools can be integrated into the software development life cycle (SDLC) to automate security testing and ensure that security vulnerabilities are identified and addressed during development.

- False Positives
  > SAST tools can generate false positives, which are security issues reported by the tool that are not actually vulnerabilities.

###### 1.3.2.3.2. Dynamic Application Security Testing

Dynamic Application Security Testing (DAST) is a type of application security testing that evaluates the security of an application in its running state. Unlike Static Application Security Testing (SAST), which analyzes the application's source code for vulnerabilities, DAST simulates attacks on the running application and identifies potential vulnerabilities in its runtime behavior.

DAST tools typically use automated scanners to simulate various types of attacks, such as injection attacks, cross-site scripting (XSS) attacks, and SQL injection attacks. The tools send malicious input to the application, monitor its behavior, and report any vulnerabilities detected.

Features of DAST:

- Scanning
  > DAST tools scan the application for vulnerabilities while it is running.

- Black-box testing
  > DAST is a black-box testing technique because it does not require access to the application's source code or internal workings.

- Automated testing
  > DAST tools use automated scanners to identify potential vulnerabilities.

- Real-world simulation
  > DAST simulates real-world attack scenarios to identify potential vulnerabilities in the application's runtime behavior.

- External testing
  > DAST is typically performed by external security testers, rather than by the development team.

Popular DAST tools include OWASP ZAP, Burp Suite, and Acunetix.

###### 1.3.2.3.3. Interactive Application Security Testing

Interactive Application Security Testing (IAST) is a type of application security testing that combines aspects of both SAST and DAST. Unlike SAST and DAST, IAST provides real-time feedback on security vulnerabilities while the application is running, allowing for faster identification and remediation of security issues.

IAST works by inserting sensors or agents into the application code, which monitor the application's behavior and identify potential security vulnerabilities. These sensors can detect vulnerabilities such as SQL injection, cross-site scripting, and buffer overflows, among others.

Features of IAST:

- Real-time feedback
  > IAST provides real-time feedback on security vulnerabilities, allowing developers to quickly identify and remediate issues.

- Accurate results
  > Since IAST monitors the application's behavior while it is running, it can provide more accurate results than SAST or DAST alone.

- Minimal false positives
  > IAST can provide more targeted results, resulting in fewer false positives than other types of testing.

- Integration with development tools
  > IAST can integrate with development tools, such as IDEs and build servers, to provide developers with easy access to security feedback.

## 2. Principle

By following these fundamental principles of software testing, testers can design and execute their testing activities more effectively, identify defects early, and improve the quality of the software application.

- Early Testing
  > Finding and fixing defects early in the software development lifecycle is less costly and time-consuming than identifying and fixing them later. Therefore, testing should be started as early as possible in the development process.

- Exhaustiveness
  > It is practically impossible to test all possible scenarios and combinations of inputs and conditions. Therefore, testers must focus on prioritizing their testing efforts based on the risks and impact of defects.

- Independence
  > Tests should be independent of each other, meaning that changes or failures in one test should not affect the results of other tests.

- Repeatability
  > Tests should be repeatable, meaning that the same test cases should produce the same results every time they are executed.

- Automation
  > Testing should be automated to the extent possible, in order to improve the efficiency and accuracy of the testing process.

- Defect Tracking
  > A process should be in place to track and manage defects, ensuring that they are identified, documented, and resolved in a timely manner.

- Continuous Improvement
  > The testing process should be continually reviewed and improved, with the goal of increasing its efficiency and effectiveness over time.

- Risk-based Approach
  > Tests should be prioritized based on the level of risk associated with the software, with the most critical or high-risk areas being tested first.

- Early Feedback
  > Feedback should be provided as early as possible, so that the development team can address any issues or defects in a timely manner.

- Involvement of Stakeholders
  > All stakeholders, including developers, testers, customers, and end users, should be involved in the testing process, in order to ensure that the software meets the needs and expectations of all stakeholders.

- Verifiability
  > The results of testing should be verifiable, meaning that they can be easily reproduced and validated.

- Traceability
  > The relationship between tests and requirements should be traceable, allowing test results to be easily linked to specific requirements.

- Accuracy
  > Tests should be accurate and consistent, ensuring that they produce reliable and repeatable results.

- Maintainability
  > Tests should be easy to maintain and update, allowing for changes in the software to be easily incorporated into the testing process.

- Reusability
  > Tests should be reusable, allowing for the same tests to be executed for multiple releases or versions of the software.

- Cost-effectiveness
  > The testing process should be cost-effective, balancing the cost of testing against the potential costs associated with defects or failures in the software.

- Efficiency
  > The testing process should be efficient, maximizing the number of tests that can be executed in a given time frame.

- Adaptability
  > The testing process should be adaptable, allowing for changes in the software or testing environment to be easily incorporated into the testing process.Collaboration
  > The testing process should be a collaborative effort, involving the contributions of multiple stakeholders, including developers, testers, and end users.

- Continuous Learning
  > The testing process should be an opportunity for continuous learning and improvement, allowing for lessons learned to be incorporated into future testing efforts.

## 3. Best Practice

By following these best practices in software testing, testers can improve the quality of the software application, identify defects early, and reduce the cost and time of testing.

- Develop a comprehensive test plan
  > A comprehensive test plan should be developed and documented, outlining the objectives, scope, and approach of the testing process.

- Define clear and measurable goals
  > Clear and measurable goals should be established for the testing process, such as identifying and resolving a specific number of defects within a given time frame.

- Implement automated testing
  > Automated testing should be implemented to the extent possible, in order to improve the efficiency and accuracy of the testing process.

- Use version control for test cases
  > Test cases should be managed using version control, allowing for changes in the software or testing environment to be easily incorporated into the testing process.

- Prioritize high-risk areas
  > High-risk areas of the software should be prioritized for testing, ensuring that the most critical or high-risk areas are tested first.

- Involve end users in testing
  > End users should be involved in the testing process, allowing for their perspectives and feedback to be incorporated into the testing process.

- Perform regular code reviews
  > Regular code reviews should be performed, in order to identify and resolve issues early in the development process.

- Use test data management tools
  > Test data management tools should be used to manage and organize test data, ensuring that the testing process is efficient and repeatable.

- Implement continuous testing
  > Continuous testing should be implemented, allowing for the testing process to be integrated into the development process and executed automatically on a regular basis.

- Monitor and evaluate test results
  > Test results should be monitored and evaluated, in order to identify areas for improvement and make changes to the testing process as needed.

- Adhere to industry standards and guidelines
  > Industry standards and guidelines should be followed, ensuring that the testing process is consistent and follows best practices.

- Integrate security testing into the testing process
  > Security testing should be integrated into the testing process, in order to identify and resolve security vulnerabilities.

- Establish clear communication channels
  > Clear communication channels should be established between all stakeholders involved in the testing process, including developers, testers, and end users.

- Invest in training and development
  > Investment in training and development should be made, in order to ensure that testers have the necessary skills and knowledge to effectively perform their tasks.

- Use test management tools
  > Test management tools should be used to manage and track the testing process, including test cases, test plans, and test results.

- Perform exploratory testing
  > Exploratory testing should be performed, in order to identify potential issues or areas for improvement that may not be easily detected through automated testing.

- Involve stakeholders in the testing process
  > Stakeholders should be involved in the testing process, including business stakeholders, project managers, and product owners.

- Encourage collaboration and teamwork
  > Collaboration and teamwork should be encouraged, allowing for the testing process to be a collaborative effort between all stakeholders.

- Perform regular retrospectives
  > Regular retrospectives should be performed, in order to evaluate the testing process and identify areas for improvement.

- Stay Up-to-Date
  > Stay up-to-date with emerging technologies and trends, in order to continuously improve the testing process and keep up with the changing landscape of software development.

## 4. Terminology

- Test Suite
  > A collection of test cases that are executed together as part of a testing cycle.

- Test Case
  > A set of steps and conditions designed to test a specific functionality, feature, scenario or aspect of a software application.

- Test Plan
  > A detailed document that outlines the testing process, including the scope, objectives, approach and resources required for the testing.

- Test Harness
  > A test harness is a set of tools and resources used to execute test cases and analyze the results.

- Test Data
  > Test data is the input used in testing, including the data used to set up test cases and the data used to verify the results.

- Test Environment
  > A the environment in which testing is performed, including the hardware, software, and other resources needed to execute the testing process.

- Test Driver
  > A program or tool used to execute test cases and analyze the results.

- Test Results
  > The outputs of the testing process, including pass/fail results, performance metrics, and other relevant data.

- Test Metrics
  > Test metrics are measures used to evaluate the quality and effectiveness of the testing process, including defect density, test case coverage, and test case execution time.

- Debugging
  > Debugging is the process of identifying and fixing defects in a software application.

- Defect
  > An issue or problem found during testing that affects the functionality, usability, or performance of the software application.

- Test Execution
  > The process of running test cases and recording the results.

- Test Automation
  > The process of using software tools and scripts to automate the execution of test cases.

- Test Report
  > A document that summarizes the testing activities and results and provides an evaluation of the software application's quality.

- Test Strategy
  > A document that outlines the overall approach, objectives, and scope of testing activities for a project.
