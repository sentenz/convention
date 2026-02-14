# Software Testing

Software testing is the process of evaluating a software application or system to identify defects or issues.

- [1. Category](#1-category)
  - [1.1. Testing Principles](#11-testing-principles)
    - [1.1.1. Methodologies](#111-methodologies)
      - [1.1.1.1. Test-Driven Development (TDD)](#1111-test-driven-development-tdd)
        - [1.1.1.1.1. Red-Green-Refactor](#11111-red-green-refactor)
      - [1.1.1.2. Behavior-Driven Development (BDD)](#1112-behavior-driven-development-bdd)
        - [1.1.1.2.1. Gherkin Syntax](#11121-gherkin-syntax)
      - [1.1.1.3. Acceptance Test-Driven Development (ATDD)](#1113-acceptance-test-driven-development-atdd)
      - [1.1.1.4. Shift-Left Testing](#1114-shift-left-testing)
      - [1.1.1.5. Shift-Right Testing](#1115-shift-right-testing)
      - [1.1.1.6. Black Box Testing](#1116-black-box-testing)
      - [1.1.1.7. White Box Testing](#1117-white-box-testing)
      - [1.1.1.8. Gray Box Testing](#1118-gray-box-testing)
    - [1.1.2. Techniques](#112-techniques)
      - [1.1.2.1. Test Double](#1121-test-double)
        - [1.1.2.1.1. Dummy](#11211-dummy)
        - [1.1.2.1.2. Fake](#11212-fake)
        - [1.1.2.1.3. Stub](#11213-stub)
        - [1.1.2.1.4. Spy](#11214-spy)
        - [1.1.2.1.5. Mock](#11215-mock)
      - [1.1.2.2. Test Fixtures](#1122-test-fixtures)
      - [1.1.2.3. Code Coverage](#1123-code-coverage)
    - [1.1.3. Guidelines](#113-guidelines)
      - [1.1.3.1. FIRST Principle](#1131-first-principle)
  - [1.2. Testing Patterns](#12-testing-patterns)
    - [1.2.1. Arrange, Act, Assert (AAA)](#121-arrange-act-assert-aaa)
    - [1.2.2. Given-When-Then (GWT)](#122-given-when-then-gwt)
    - [1.2.3. In-Got-Want](#123-in-got-want)
    - [1.2.4. Table-Driven Testing](#124-table-driven-testing)
    - [1.2.5. Data-Driven Testing](#125-data-driven-testing)
  - [1.3. Testing Types](#13-testing-types)
    - [1.3.1. Functional Testing](#131-functional-testing)
      - [1.3.1.1. Unit Testing](#1311-unit-testing)
      - [1.3.1.2. Integration Testing](#1312-integration-testing)
        - [1.3.1.2.1. Top-Down Integration Testing](#13121-top-down-integration-testing)
        - [1.3.1.2.2. Bottom-Up Integration Testing](#13122-bottom-up-integration-testing)
      - [1.3.1.3. System Testing](#1313-system-testing)
      - [1.3.1.4. End-to-End (E2E) Testing](#1314-end-to-end-e2e-testing)
      - [1.3.1.5. Regression Testing](#1315-regression-testing)
        - [1.3.1.5.1. Snapshot Testing](#13151-snapshot-testing)
      - [1.3.1.6. Acceptance Testing](#1316-acceptance-testing)
        - [1.3.1.6.1. User Acceptance Testing](#13161-user-acceptance-testing)
        - [1.3.1.6.2. Operational Acceptance Testing](#13162-operational-acceptance-testing)
      - [1.3.1.7. Alpha Testing](#1317-alpha-testing)
      - [1.3.1.8. Beta Testing](#1318-beta-testing)
      - [1.3.1.9. User Experience (UX) Testing](#1319-user-experience-ux-testing)
        - [1.3.1.9.1. Usability Testing](#13191-usability-testing)
        - [1.3.1.9.2. Cross-Browser Testing](#13192-cross-browser-testing)
        - [1.3.1.9.3. Compatibility Testing](#13193-compatibility-testing)
        - [1.3.1.9.4. Accessibility Testing](#13194-accessibility-testing)
      - [1.3.1.10. Sanity Testing](#13110-sanity-testing)
      - [1.3.1.11. Smoke Testing](#13111-smoke-testing)
      - [1.3.1.12. Exploratory Testing](#13112-exploratory-testing)
      - [1.3.1.13. A/B Testing](#13113-ab-testing)
      - [1.3.1.14. Monkey Testing](#13114-monkey-testing)
    - [1.3.2. Non-Functional Testing](#132-non-functional-testing)
      - [1.3.2.1. Security Testing](#1321-security-testing)
        - [1.3.2.1.1. Penetration Testing](#13211-penetration-testing)
        - [1.3.2.1.2. Fuzz Testing](#13212-fuzz-testing)
      - [1.3.2.2. Application Security Testing](#1322-application-security-testing)
        - [1.3.2.2.1. Static Application Security Testing (SAST)](#13221-static-application-security-testing-sast)
        - [1.3.2.2.2. Dynamic Application Security Testing (DAST)](#13222-dynamic-application-security-testing-dast)
        - [1.3.2.2.3. Interactive Application Security Testing (IAST)](#13223-interactive-application-security-testing-iast)
      - [1.3.2.3. Performance Testing](#1323-performance-testing)
        - [1.3.2.3.1. Load Testing](#13231-load-testing)
        - [1.3.2.3.2. Stress Testing](#13232-stress-testing)
        - [1.3.2.3.3. Endurance Testing](#13233-endurance-testing)
        - [1.3.2.3.4. Spike Testing](#13234-spike-testing)
        - [1.3.2.3.5. Volume Testing](#13235-volume-testing)
        - [1.3.2.3.6. Scalability Testing](#13236-scalability-testing)
        - [1.3.2.3.7. Capacity Testing](#13237-capacity-testing)
- [2. Terminology](#2-terminology)
- [3. References](#3-references)

## 1. Category

### 1.1. Testing Principles

#### 1.1.1. Methodologies

##### 1.1.1.1. Test-Driven Development (TDD)

Test-Driven Development (TDD) is a software development approach that emphasizes writing tests before writing the actual code. The main idea behind TDD is to create a set of automated tests that define the desired behavior of the software, and then write the code to make those tests pass.

1. Features and Benefits

    - Improved Code Quality
      > TDD encourages developers to write clean, modular, and maintainable code by focusing on small, testable units of functionality.

    - Early Bug Detection
      > Writing tests before code helps identify defects early in the development process, reducing the likelihood of bugs in production.

    - Better Design
      > TDD promotes better software design by encouraging developers to think about the desired behavior of the system before implementing it.

    - Documentation
      > The tests created during TDD serve as living documentation that describes the expected behavior of the software.

    - Confidence in Refactoring
      > With a comprehensive suite of tests, developers can refactor code with confidence, knowing that any changes will be validated by the tests.

###### 1.1.1.1.1. Red-Green-Refactor

[Red-Green-Refactor](https://agiledata.org/essays/tdd.html) is a fundamental cycle in Test-Driven Development (TDD) that emphasizes writing tests before code and iteratively improving the codebase. The cycle consists of three main phases: Red, Green, and Refactor.

1. Concepts and Components

    - Red (Failing Test)
      > In the **Red** phase, the developer writes a test for a new piece of functionality, knowing that it will initially fail because the code to satisfy the test has not been written yet.

    - Green (Passing Test)
      > In the **Green** phase, you write the simplest possible code that makes the failing test pass. The goal here is not to write perfect code but to write just enough code to satisfy the test.

    - Refactor (Improve Code Quality)
      > In the **Refactor** phase, you clean up the code that was written in the **Green** phase. The goal is to improve the structure, readability, or performance of the code without changing its behavior. You should refactor both the **production code** and the **test code** if necessary.

2. Features and Benefits

    - Incremental Development
      > The Red-Green-Refactor cycle promotes incremental development, allowing developers to build functionality step by step.

    - Immediate Feedback
      > By writing tests first, developers receive immediate feedback on whether their code meets the specified requirements.

    - Improved Code Quality
      > The refactoring phase encourages developers to continuously improve the codebase, leading to cleaner and more maintainable code.

    - Reduced Defects
      > Writing tests before code helps catch defects early in the development process, reducing the likelihood of bugs in production.

3. Examples and Explanations

    - Red
      > Write a failing test for a new feature, such as adding two numbers. The test will fail since the `divide()` function is not implemented yet.

      ```python
      def test_divide():
          result = divide(1, 2)
          assert result == 0.5
      ```

    - Green
      > Write the simplest code to make the test pass. Implementing the `divide()` function is just enough to pass the original test (`assert result == 0.5`), but the code may be inefficient or incomplete.

      ```python
      def divide(a, b):
          return a / b
      ```

    - Refactor
      > Clean up the code, ensuring all tests still pass. Refactor the code by applying best practices, removing duplication, enhancing maintainability, or improving performance.

      ```python
      def divide(a, b):
          if b == 0:
              raise ValueError("Cannot divide by zero")
          return a / b
      ```

##### 1.1.1.2. Behavior-Driven Development (BDD)

Behavior-Driven Development (BDD) is a software development approach that emphasizes collaboration between developers, testers, and business stakeholders to define the behavior of a system through examples and scenarios. BDD focuses on the desired behavior of the application from the user's perspective, promoting clear communication and shared understanding among all parties involved in the development process.

1. Features and Benefits

    - Collaboration
      > BDD encourages collaboration between developers, testers, and business stakeholders to define the behavior of the system.

    - Clear Communication
      > BDD uses a common language that is easily understood by all stakeholders, reducing misunderstandings and misinterpretations.

    - Focus on Behavior
      > BDD emphasizes the desired behavior of the system from the user's perspective, ensuring that the software meets user needs.

    - Test Automation
      > BDD scenarios can be automated using tools like Cucumber, SpecFlow, or Behave, allowing for continuous testing and feedback.

    - Living Documentation
      > BDD scenarios serve as living documentation that evolves with the system, providing a clear understanding of its behavior over time.

###### 1.1.1.2.1. Gherkin Syntax

[Gherkin Syntax](https://cucumber.io/docs/gherkin/) is a structured language used primarily in [Behavior-Driven Development (BDD)](#1112-behavior-driven-development-bdd) using the [Given-When-Then](#122-given-when-then-gwt) pattern and facilitates clear, structured, and executable test scenarios. It promotes collaboration between technical and non-technical stakeholders by using plain language and ensures that the behavior of the application is thoroughly tested and meets business requirements.

1. Concepts and Components

    Gherkin is a specific set of keywords and structure, to describe behavior in a consistent format.

    - Feature
      > A high-level description of a specific functionality of the application being tested. It groups related scenarios that pertain to the same behavior or feature.

      ```gherkin
      Feature: User login functionality
      ```

    - Scenario
      > Each **Scenario** describes a single use case or test case for a specific functionality. Each scenario consists of a series of steps.

      ```gherkin
      Scenario: Successful login with valid credentials
      ```

    - Scenario Outline
      > Used when you want to run the same scenario multiple times with different sets of data. It allows you to specify inputs in a tabular format under the **Examples** section.

      ```gherkin
      Scenario Outline: User tries to log in with different credentials
        Given the user navigates to the login page
        When the user logs in with "<username>" and "<password>"
        Then the user should see the dashboard

        Examples:
        | username  | password  |
        | john_doe  | password1 |
        | jane_doe  | password2 |
      ```

    - Given
      > Defines the preconditions or the initial context of the scenario. These steps describe the system's state before the user interacts with it.

      ```gherkin
      Given the user is on the login page
      ```

    - When
      > Specifies the action or event performed by the user or system. It triggers some behavior, such as submitting a form, clicking a button, or making an API request.

      ```gherkin
      When the user enters valid login credentials
      ```

    - Then
      > Specifies the expected outcome or result of the previous action. It typically contains assertions about what should happen after the **When** step is executed.

      ```gherkin
      Then the user should be redirected to the homepage
      ```

    - And/But
      > **And/But** are connectors used to add additional steps within a **Given**, **When**, or **Then** block. They make scenarios more readable without repeating the keywords.

      ```gherkin
      Given the user is on the login page
      And the user enters a valid username
      And the user enters a valid password
      When the user clicks the login button
      Then the user should see the homepage
      ```

    - Background
      > Allows defining common steps that apply to all scenarios within a feature file. This eliminates the need to repeat those steps in every scenario.

      ```gherkin
      Background:
        Given the user is on the homepage
      ```

2. Files and Folders

    - `login_functionality.feature`
      > Gherkin Syntax in a `.feature` file consisting of multiple scenarios.

      ```gherkin
      Feature: User login functionality

        Background:
          Given the user is on the homepage

        Scenario: Successful login with valid credentials
          Given the user navigates to the login page
          When the user enters valid credentials
          Then the user should be redirected to the homepage

        Scenario: Login attempt with invalid password
          Given the user navigates to the login page
          When the user enters a valid username and an invalid password
          Then the user should see an error message

        Scenario Outline: User tries to log in with multiple credentials
          Given the user navigates to the login page
          When the user logs in with "<username>" and "<password>"
          Then the user should see the appropriate dashboard

          Examples:
          | username  | password  |
          | john_doe  | password1 |
          | jane_doe  | password2 |
      ```

3. Features and Benefits

    - Readability
      > Gherkin is easy to understand for all stakeholders. It reduces the gap between technical and non-technical team members by using plain language.

    - Collaboration
      > Since Gherkin scenarios are readable by anyone, they foster collaboration between developers, testers, and business stakeholders in defining requirements.

    - Automation
      > Gherkin scenarios are easily automatable. Tools like **Cucumber**, **SpecFlow**, or **Behat** take Gherkin files and link them to underlying code that runs the tests.

    - Traceability
      > Gherkin test scenarios can directly map to user stories or requirements, ensuring clear traceability from requirements to testing.

    - Reusability
      > The structured syntax allows for the reusability of steps across different scenarios, reducing redundancy and increasing maintainability.

4. Tools and Frameworks

    Tools and frameworks for **Behavior-Driven Development (BDD)** using **Gherkin Syntax**. Each tool provides a similar structure of **feature files** written in **Gherkin Syntax** and step definitions implemented in the corresponding language, enabling collaboration between developers, testers, and non-technical stakeholders.

    - Cucumber
      > [Cucumber](https://cucumber.io/) is a BDD frameworks, supporting **Gherkin Syntax** for multiple programming languages like **Java**, **JavaScript**, **Ruby**, or **Kotlin**.

      - Gherkin Syntax

        ```gherkin
        Feature: Login functionality

          Scenario: Successful login with valid credentials
            Given the user is on the login page
            When the user enters valid credentials
            Then the user should be redirected to the dashboard
        ```

      - Step Definitions

        ```java
        import io.cucumber.java.en.*;

        public class LoginSteps {

            @Given("the user is on the login page")
            public void userIsOnLoginPage() {
                System.out.println("User is on the login page");
            }

            @When("the user enters valid credentials")
            public void userEntersValidCredentials() {
                System.out.println("User enters valid credentials");
            }

            @Then("the user should be redirected to the dashboard")
            public void userRedirectedToDashboard() {
                System.out.println("User is redirected to the dashboard");
            }
        }
        ```

    - SpecFlow
      > [SpecFlow](https://specflow.org/) is a BDD framework specifically for **.NET/C#** applications. It provides **Gherkin Syntax** to write executable specifications in plain text. Integrates with **Visual Studio** and **.NET** development. Supports **xUnit**, **NUnit**, and **MSTest**.

      - Gherkin Syntax

        ```gherkin
        Feature: Login functionality

          Scenario: Successful login with valid credentials
            Given the user is on the login page
            When the user enters valid credentials
            Then the user should be redirected to the dashboard
        ```

      - Step Definitions

        ```csharp
        using TechTalk.SpecFlow;

        [Binding]
        public class LoginSteps
        {
            [Given(@"the user is on the login page")]
            public void GivenTheUserIsOnTheLoginPage()
            {
                Console.WriteLine("User is on the login page");
            }

            [When(@"the user enters valid credentials")]
            public void WhenTheUserEntersValidCredentials()
            {
                Console.WriteLine("User enters valid credentials");
            }

            [Then(@"the user should be redirected to the dashboard")]
            public void ThenTheUserShouldBeRedirectedToTheDashboard()
            {
                Console.WriteLine("User is redirected to the dashboard");
            }
        }
        ```

    - Behave
      > [Behave](https://behave.readthedocs.io/en/latest/) is a popular **BDD** framework for **Python** using **Gherkin Syntax** for writing test cases. Integrates with Python testing frameworks like **unittest** and **pytest**.

      - Gherkin Syntax

        ```gherkin
        Feature: Login functionality

          Scenario: Successful login with valid credentials
            Given the user is on the login page
            When the user enters valid credentials
            Then the user should be redirected to the dashboard
        ```

      - Step Definitions

        ```python
        from behave import given, when, then

        @given('the user is on the login page')
        def step_given_user_on_login_page(context):
            print("User is on the login page")

        @when('the user enters valid credentials')
        def step_when_user_enters_valid_credentials(context):
            print("User enters valid credentials")

        @then('the user should be redirected to the dashboard')
        def step_then_user_redirected_to_dashboard(context):
            print("User is redirected to the dashboard")
        ```

    - Behat
      > [Behat](https://behat.org/) is a **BDD** framework for **PHP** using **Gherkin Syntax** to define feature files and automate testing based on these human-readable descriptions. Integrates with **PHPUnit** and **Mink** for browser automation and API testing.

      - Gherkin Syntax

        ```gherkin
        Feature: Login functionality

          Scenario: Successful login with valid credentials
            Given the user is on the login page
            When the user enters valid credentials
            Then the user should be redirected to the dashboard
        ```

      - Step Definitions

        ```php
        <?php

        use Behat\Behat\Context\Context;

        class LoginContext implements Context
        {
            /**
            * @Given the user is on the login page
            */
            public function theUserIsOnTheLoginPage()
            {
                echo "User is on the login page\n";
            }

            /**
            * @When the user enters valid credentials
            */
            public function theUserEntersValidCredentials()
            {
                echo "User enters valid credentials\n";
            }

            /**
            * @Then the user should be redirected to the dashboard
            */
            public function theUserShouldBeRedirectedToTheDashboard()
            {
                echo "User is redirected to the dashboard\n";
            }
        }
        ?>
        ```

    - Cucumber-CPP
      > [Cucumber-CPP](https://github.com/cucumber/cucumber-cpp) is an implementation of **Cucumber** for **C++** that enables BDD-style testing using **Gherkin Syntax** feature files. Integrates with **Boost.Test**, **Google Test**, or **Catch2** frameworks.

      - Gherkin Syntax

        ```gherkin
        Feature: Login functionality

          Scenario: Successful login with valid credentials
            Given the user is on the login page
            When the user enters valid credentials
            Then the user should be redirected to the dashboard
        ```

      - Step Definitions

        ```cpp
        #include <cucumber-cpp/autodetect.hpp>
        using cucumber::ScenarioScope;

        GIVEN("^the user is on the login page$") {
            std::cout << "User is on the login page" << std::endl;
        }

        WHEN("^the user enters valid credentials$") {
            std::cout << "User enters valid credentials" << std::endl;
        }

        THEN("^the user should be redirected to the dashboard$") {
            std::cout << "User is redirected to the dashboard" << std::endl;
        }
        ```

##### 1.1.1.3. Acceptance Test-Driven Development (ATDD)

Acceptance Test-Driven Development (ATDD) is a software development approach that focuses on defining and validating the acceptance criteria of a software application before development begins. It involves collaboration between developers, testers, and business stakeholders to ensure that the software meets the needs of its users.

1. Features and Benefits

    - Collaboration
      > ATDD encourages collaboration between developers, testers, and business stakeholders to ensure that the software meets the needs of its users.

    - Clear Requirements
      > By defining acceptance criteria before development begins, ATDD helps ensure that requirements are clear and well-understood.

    - Early Validation
      > ATDD allows for early validation of the software against the defined acceptance criteria, reducing the likelihood of defects and improving overall quality.

    - Improved Communication
      > ATDD promotes better communication between team members, leading to a shared understanding of requirements and expectations.

    - Reduced Rework
      > By validating the software against acceptance criteria early in the development process, ATDD can help reduce the amount of rework required later on.

    - Customer Satisfaction
      > By ensuring that the software meets the needs of its users, ATDD can help improve customer satisfaction and increase the likelihood of successful project outcomes.

##### 1.1.1.4. Shift-Left Testing

Shift-left testing is a software testing approach that emphasizes the importance of testing early in the software development lifecycle (SDLC). The goal of shift-left testing is to identify and address defects and issues as early as possible in the development process, which can help reduce costs, improve quality, and accelerate time-to-market.

1. Features and Benefits

    - Early Defect Detection
      > By testing early in the development process, defects can be identified and addressed before they become more complex and costly to fix.

    - Cost Reduction
      > Addressing defects early in the SDLC is generally less expensive than fixing them later in the process, leading to overall cost savings.

    - Improved Quality
      > Early testing helps ensure that the software meets quality standards from the outset, reducing the likelihood of defects in later stages.

    - Faster Time-to-Market
      > By identifying and addressing issues early, the overall development process can be streamlined, leading to faster delivery of the final product.

    - Enhanced Collaboration
      > Shift-left testing encourages collaboration between developers, testers, and other stakeholders early in the process, fostering a shared understanding of requirements and quality goals.

    - Continuous Integration and Testing
      > Shift-left testing often involves integrating testing into continuous integration (CI) pipelines, allowing for automated testing and rapid feedback on code changes.

##### 1.1.1.5. Shift-Right Testing

Shift-right testing is a software testing approach that focuses on testing software in production or real-world environments after it has been deployed. This approach aims to identify issues that may not have been detected during pre-production testing, such as performance bottlenecks, security vulnerabilities, and user experience problems.

1. Features and Benefits

    - Real-world Testing
      > Shift-right testing allows for testing in real-world environments, which can help identify issues that may not have been detected during pre-production testing.

    - Continuous Monitoring
      > Shift-right testing involves continuous monitoring of the software in production, which can help identify issues as they arise.

    - User Feedback
      > Shift-right testing allows for gathering user feedback in real-time, which can help improve the user experience and identify areas for improvement.

    - A/B Testing
      > Shift-right testing can involve A/B testing, which allows for testing different versions of the software to determine which version performs better.

    - Canary Releases
      > Shift-right testing can involve canary releases, which allow for rolling out new features or changes to a small subset of users before deploying them to the entire user base.

    - Improved Quality
      > By identifying and addressing issues in production, shift-right testing can help improve the overall quality of the software.

##### 1.1.1.6. Black Box Testing

Black box testing is a software testing technique that focuses on testing the functionality of a software application without any knowledge of its internal workings. In black box testing, the tester is only concerned with the inputs and outputs of the system being tested, rather than how the system processes those inputs.

1. Features and Benefits

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

##### 1.1.1.7. White Box Testing

White box testing, also known as clear box testing or glass box testing, is a software testing technique that involves testing the internal workings of a software application. In white box testing, the tester has access to the source code and can examine the internal logic and structure of the application being tested.

1. Features and Benefits

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

##### 1.1.1.8. Gray Box Testing

Gray box testing is a software testing technique that combines elements of both black box and white box testing. In gray box testing, the tester has partial knowledge of the internal workings of the system being tested, allowing them to design tests that are more targeted and effective than those used in black box testing.

1. Features and Benefits

    - Partial knowledge
      > The tester has some knowledge of the internal workings of the system, such as the design and architecture, but not complete knowledge of the code.

    - Test design and execution
      > Gray box testing involves both test design and execution, with the tester using their partial knowledge to create more effective tests.

    - Combination of techniques
      > Gray box testing combines techniques from both black box and white box testing, leveraging the advantages of each to create a more comprehensive testing approach.

    - Focused testing
      > Gray box testing is typically more focused than black box testing, as the tester has some knowledge of the internal workings of the system and can target specific areas for testing.

#### 1.1.2. Techniques

##### 1.1.2.1. Test Double

A test double is a generic term for any case where you replace a production object with a test-specific version of that object. Test doubles are used to isolate the unit of code being tested, allowing for more controlled and predictable testing scenarios. There are several types of test doubles, each serving a specific purpose in the testing process.

1. Features and Benefits

    - Isolation
      > Test doubles help isolate the unit of code being tested, allowing for more focused and effective testing.

    - Control
      > Test doubles provide greater control over the behavior of dependencies, allowing for more predictable testing scenarios.

    - Simplification
      > Test doubles can simplify complex dependencies, making it easier to test the unit of code in isolation.

    - Speed
      > Test doubles can improve the speed of tests by reducing the need for complex setup and teardown procedures.

    - Flexibility
      > Test doubles can be easily modified or replaced, allowing for greater flexibility in testing scenarios.

###### 1.1.2.1.1. Dummy

A dummy is a simple object that is passed around but never actually used. It is typically used to fill parameter lists when the actual value is not important for the test.

1. Examples and Explanations

    ```python
    # Dummy example
    class DummyUserRepository:
        def get_user(self, user_id):
            pass  # This method will never be called in the test

    def test_dummy_user_repository():
        user_service = UserService(DummyUserRepository())
        # Asserts go here, knowing that get_user will not be called
    ```

###### 1.1.2.1.2. Fake

A fake is a working implementation, but usually takes shortcuts which make it not suitable for production (an in-memory database is a good example).

1. Examples and Explanations

    ```python
    # Fake example
    class FakeUserRepository:
        def __init__(self):
            self.users = {}  # In-memory store for users

        def add_user(self, user_id, user):
            self.users[user_id] = user

        def get_user(self, user_id):
            return self.users.get(user_id)

    def test_fake_user_repository():
        fake_repo = FakeUserRepository()
        fake_repo.add_user(1, User(name="John Doe"))
        user_service = UserService(fake_repo)
        assert user_service.get_user_name(1) == "John Doe"
    ```

###### 1.1.2.1.3. Stub

Stubs provide predefined responses to method calls made during the test, usually not responding to anything outside what's programmed in for the test.

1. Examples and Explanations

    ```python
    # Stub example
    class StubUserRepository:
        def get_user(self, user_id):
            return User(name="John Doe") if user_id == 1 else None

    def test_stub_user_repository():
        user_service = UserService(StubUserRepository())
        assert user_service.get_user_name(1) == "John Doe"
        assert user_service.get_user_name(2) is None
    ```

###### 1.1.2.1.4. Spy

A spy is a test double that records information about how it was called, allowing verification of interactions after the test execution.

1. Examples and Explanations

    ```python
    # Spy example
    class SpyUserRepository:
        def __init__(self):
            self.calls = []

        def get_user(self, user_id):
            self.calls.append(user_id)
            return User(name="John Doe") if user_id == 1 else None

    def test_spy_user_repository():
        spy_repo = SpyUserRepository()
        user_service = UserService(spy_repo)
        user_service.get_user_name(1)
        user_service.get_user_name(2)
        assert spy_repo.calls == [1, 2]
    ```

###### 1.1.2.1.5. Mock

Mocks are pre-programmed with expectations which form a specification of the calls they are expected to receive. They can verify that the expected interactions occurred.

1. Examples and Explanations

    ```python
    # Mock example
    class MockUserRepository:
        def __init__(self):
            self.expected_calls = []

        def expect_call(self, user_id, return_value):
            self.expected_calls.append((user_id, return_value))

        def get_user(self, user_id):
            for expected_user_id, return_value in self.expected_calls:
                if expected_user_id == user_id:
                    return return_value
            raise AssertionError(f"Unexpected call with user_id: {user_id}")

    def test_mock_user_repository():
        mock_repo = MockUserRepository()
        mock_repo.expect_call(1, User(name="John Doe"))
        mock_repo.expect_call(2, None)
        user_service = UserService(mock_repo)
        assert user_service.get_user_name(1) == "John Doe"
        assert user_service.get_user_name(2) is None
    ```

##### 1.1.2.2. Test Fixtures

A test fixture is a fixed state of a set of objects used as a baseline for running tests. It ensures that tests are repeatable and consistent by providing a known environment in which tests can be executed. Test fixtures can include the setup and teardown of test data, configurations, and any other necessary conditions required for the tests to run correctly.

1. Features and Benefits

    - Setup
      > Before the execution of a test, the test fixture is set up. This typically involves creating objects, initializing databases, or setting up necessary conditions that the test relies on.

    - Teardown
      > After the test execution, the test fixture is often torn down to clean up any changes made during the test. This could include deleting test data, closing connections, or resetting states.

    - Reusable Code
      > Test fixtures are typically defined in a way that they can be reused across multiple tests. For example, a database fixture might be used in several tests to ensure the database is in a known state before each test runs.

    - Isolation
      > The purpose of a test fixture is to ensure that each test runs in isolation. The outcome of one test should not affect another, which is why fixtures help maintain consistency across test executions.

2. Examples and Explanations

    - Unit Test
      > Test fixtures in Python using the `unittest` framework.

      ```python
      import unittest

      class TestExample(unittest.TestCase):

          def setUp(self):
              # Code to set up test fixtures, e.g. initializing variables, creating objects
              self.sample_data = [1, 2, 3, 4, 5]

          def tearDown(self):
              # Code to clean up after tests, e.g. deleting objects, closing database connections
              self.sample_data = None

          def test_sum(self):
              result = sum(self.sample_data)
              self.assertEqual(result, 15)

      if __name__ == '__main__':
          unittest.main()
      ```

      - Setup
        > `setUp` method is used to set up the test fixtures.

      - Teardown
        > `tearDown` method is used to clean up after test execution.

##### 1.1.2.3. Code Coverage

Code coverage is a software testing metric that measures the extent to which the source code of a program is executed during testing. It provides insights into which parts of the code have been tested and which parts have not, helping developers identify areas that may require additional testing.

1. Concepts and Components

    - Statement Coverage
      > This measures the percentage of statements in the source code that are executed during testing.

    - Branch Coverage
      > This measures the percentage of decision points (such as if/else statements) that are executed during testing.

    - Function Coverage
      > This measures the percentage of functions in the source code that are executed during testing.

    - Condition Coverage
      > This measures the percentage of Boolean expressions (such as `if x > 0`) that are executed during testing.

#### 1.1.3. Guidelines

##### 1.1.3.1. FIRST Principle

The FIRST Principle is a guideline for writing effective tests to ensure tests are reliable, maintainable, and useful throughout the software development lifecycle.

1. Concepts and Components

    - Fast
      > Tests should run quickly so that developers can execute them frequently and receive rapid feedback during development.

    - Independent
      > Tests should not depend on each other. Every test must be able to run in isolation and in any order.

    - Repeatable
      > Tests should produce the same result every time they run, regardless of environment, machine, or execution time.

    - Self-validating
      > Tests should automatically report pass or fail outcomes without requiring manual inspection of logs or output.

    - Timely
      > Tests should be written at the right time, ideally close to when the production code is written, to guide design and prevent defects early.

### 1.2. Testing Patterns

Testing patterns are reusable solutions to common problems encountered during software testing. They provide a structured approach to writing tests, improving test organization, readability, and maintainability. Testing patterns can be applied across various testing methodologies, including unit testing, integration testing, and acceptance testing.

#### 1.2.1. Arrange, Act, Assert (AAA)

Arrange, Act, Assert (AAA) is a software testing pattern that provides a structured approach to writing unit tests. The AAA pattern helps to organize test code into three distinct sections: Arrange, Act, and Assert. This structure improves the readability and maintainability of tests by clearly separating the setup, execution, and verification phases of a test case.

1. Concepts and Components

    - Arrange
      > Setup the test environment by creating the necessary objects, initializing variables, and providing input data required for the test. This step ensures that the unit under test (the code being tested) has the appropriate conditions to execute the test scenario correctly.

    - Act
      > Involves executing the specific method or functionality of the unit to test. This typically involves calling a method or performing some action on the unit under test using the provided input data from the `Arrange` phase.

    - Assert
      > Verify the outcome of the test. Check whether the actual result of the action taken in the `Act` phase matches the expected result that you defined during the `Arrange` phase. If the outcome is as expected, the test passes, otherwise, it fails, indicating a potential problem in the code.

2. Examples and Explanations

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

#### 1.2.2. Given-When-Then (GWT)

[Given-When-Then (GWT)](https://martinfowler.com/bliki/GivenWhenThen.html) is a testing pattern used in the [Gherkin Syntax](#11121-gherkin-syntax) to structure executable scenarios, commonly applied in [Behavior-Driven Development (BDD)](#1112-behavior-driven-development-bdd) and [Acceptance Test-Driven Development (ATDD)](#1113-acceptance-test-driven-development-atdd). GWT improves readability and clarity by separating preconditions (Given), the triggering action (When), and the expected outcome (Then), which helps communication between technical and non-technical stakeholders.

1. Concepts and Components

    - Given
      > The `Given` section sets up the initial context or the preconditions for the test scenario. It describes the state of the system or the environment before the action being tested occurs. This typically includes creating objects, initializing variables, and any necessary setup steps.

    - When
      > The `When` section represents the action or event that triggers the behavior being tested. It is the specific operation or method call that you want to verify for correctness.

    - Then
      > The `Then` section defines the expected outcome or behavior of the system after the action in the `When` section has been performed. It includes assertions or expectations to check whether the actual result matches the expected result.

2. Examples and Explanations

    - Gherkin Syntax
      > Gherkin is a language used to write user stories and scenarios for Behavior-Driven Development (BDD).

      ```gherkin
      Feature: User login

        Scenario: Successful login with valid credentials
          Given the user is on the login page
          When the user enters a valid username and password
          And the user clicks the login button
          Then the user is redirected to the dashboard

        Scenario: Unsuccessful login with invalid credentials
          Given the user is on the login page
          When the user enters an invalid username or password
          And the user clicks the login button
          Then an error message is displayed
      ```

      - `Feature`
        > Describes the feature under test.
      - `Scenario`
        > Describes a specific situation or case.
      - `Given`
        > Sets up the initial context.
      - `When`
        > Describes an action or event.
      - `Then`
        > Describes the expected outcome.
      - `And`/`But`
        > Are used to add more conditions to `Given`, `When`, or `Then`.

#### 1.2.3. In-Got-Want

The In-Got-Want pattern is used in Test-Driven Development (TDD) and is common in unit-testing scenarios. It formalizes test cases by separating inputs (In), actual results (Got), and expected results (Want). The separation improves readability, makes failures easier to diagnose, and pairs well with table-driven testing.

1. Concepts and Components

    - In
      > Represents the input data or parameters provided to the function or method being tested. This section defines the conditions under which the test is executed.

    - Got
      > Represents the actual output or result obtained from executing the function or method with the provided input. This section captures what the code produces when given the specified input.

    - Want
      > Represents the expected output or result that should be produced by the function or method when given the specified input. This section defines the correct behavior of the code under test.

2. Examples and Explanations

    ```go
    func TestAdd(t *testing.T) {
      t.Parallel()

      // In-Got-Want 
      type in struct {
        a int
        b int
      }

      type want struct {
        value int
        err   error
      }

      // Table-Driven Testing
      tests := []struct {
        name string
        in   in
        want want
      }{
        {
          name: "valid positive input",
          in: in{
            a: 25,
            b: 100,
          },
          want: want{
            value: 125,
            err:   nil,
          },
        },
        {
          name: "valid nagative input",
          in: in{
            a: -50,
            b:   -200,
          },
          want: want{
            value: -250,
            err:   nil,
          },
        },
        {
          name: "invalid edge case",
          in: in{
            a: max + 1,
            b: min -1,
          },
          want: want{
            value: 0,
            err:   errors.New(out of the range),
          },
        },
      }

      for _, tt := range tests {
        t.Run(tt.name, func(t *testing.T) {
          got, err := Add(tt.in.a, tt.in.b)
          if !errors.Is(err, tt.want.err) {
            t.Errorf("Add() error = %v, want err %v", err, tt.want.err)
          }
          if !cmp.Equal(got, tt.want.value) {
            t.Errorf("Add(%+v) = %v, want %v", tt.in, got, tt.want.value)
          }
        })
      }
    }
    ```

#### 1.2.4. Table-Driven Testing

Table-Driven Testing is a software testing pattern that involves organizing test cases in a tabular format, where each row represents a different test case with its own set of inputs and expected outputs. This pattern is particularly useful for testing functions or methods that have multiple input combinations and expected results.

> [!NOTE]
> Table-Driven Testing promotes code reusability, maintainability, and readability by separating the test data from the test logic. It allows developers to easily add or modify test cases without changing the underlying test implementation.

1. Concepts and Components

    - Test Table
      > The **test table** is the core of table-driven testing. It holds multiple test cases in a structured format, typically as a list or array of input-output pairs. Each row of the table represents a single test case with its own unique inputs, expected outputs, and sometimes other metadata.

    - Test Driver (Iteration Loop)
      > The **test driver** is the mechanism that iterates over the rows in the test table, executing each test case one by one. The test driver fetches the inputs from each row, passes them to the function being tested, and captures the actual output.

2. Features and Benefits

    - Consitency
      > Concise and readable representation of test cases and  test coverage.

    - Maintenability
      > Easy to add or modify test cases without affecting the test implementation.

    - Clarity
      > Simplifies the process of generating test data for a wide range of scenarios.

3. Examples and Explanations

    - `*_test.go`
      > Test files in Go are named with the suffix `_test.go` to indicate test functions.

      > [!NOTE]
      > The `cmp` package is intended for testing, not production use. It may panic when it detects an incorrect comparison to help users improve tests. Given `cmp` propensity to panic, it is unsuitable for production code where a spurious panic could be fatal.

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
            name: "valid negative input",
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
              err:   errors.New("out of range"),
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

#### 1.2.5. Data-Driven Testing

Data-Driven Testing is a software testing technique that involves separating test data from test scripts, allowing the same test logic to be executed with multiple sets of input data.

> [!NOTE]
> Data-Driven Testing enhances test coverage, maintainability, and reusability by enabling testers to easily add or modify test data without changing the underlying test code.

1. Concepts and Components

    - Test Data
      > Test data is the input values and expected results used in the test cases. In data-driven testing, test data is typically stored in external sources such as spreadsheets, databases, or CSV files.

    - Test Script
      > The test script contains the logic for executing the test cases. It reads the test data from the external source and iterates through each set of data to perform the tests.

2. Features and Benefits

    - Reusability
      > Test scripts can be reused with different sets of test data, reducing redundancy and improving efficiency.

    - Maintainability
      > Test data can be easily updated or modified without changing the test scripts, making it easier to maintain tests over time.

    - Enhanced Test Coverage
      > Data-driven testing allows for a wide range of input combinations to be tested, improving overall test coverage.

    - Separation of Concerns
      > By separating test data from test logic, data-driven testing promotes a cleaner and more organized testing approach.

3. Examples and Explanations

    - `test_data.py`
      > Using the Python `unittest` framework with data-driven testing.

      ```python
      import unittest
      import json

      class TestDataDriven(unittest.TestCase):

          def load_test_data(self, file_path):
              with open(file_path, 'r') as file:
                  return json.load(file)

          def test_addition(self):
              test_data = self.load_test_data('test_data.json')
              for case in test_data:
                  with self.subTest(case=case):
                      in.a = case['in']['a']
                      in.b = case['in']['b']
                      want = case['want']
                      got = in.a + in.b
                      self.assertEqual(got, want)

      if __name__ == '__main__':
          unittest.main()
      ```

    - `test_data.json`
      > JSON file containing test data for data-driven testing.

      ```json
      [
          {
              "in": {"a": 5, "b": 10},
              "want": 15
          },
          {
              "in": {"a": -5, "b": 5},
              "want": 0
          },
          {
              "in": {"a": 0, "b": 0},
              "want": 0
          }
      ]
      ```

### 1.3. Testing Types

#### 1.3.1. Functional Testing

Functional testing is a type of software testing that focuses on verifying that the software application functions as intended and meets the specified requirements. The purpose of functional testing is to ensure that the software behaves correctly and produces the expected results for a given set of inputs.

##### 1.3.1.1. Unit Testing

Unit testing is a type of software testing that focuses on testing individual units or components of a software application in isolation to ensure that they function correctly. The purpose of unit testing is to validate that each unit of the software performs as intended and meets the specified requirements.

1. Features and Benefits

    - Scope
      > Unit testing focuses on testing individual units or components of the software application in isolation.

    - Test Environment
      > Unit testing is typically performed in a test environment that simulates the production environment to ensure that the application performs as expected in a real-world environment.

    - Test Types
      > Unit testing can involve a variety of testing types, such as functional testing, performance testing, and security testing, depending on the nature of the unit being tested.

    - Test Frameworks
      > Unit testing requires a test framework, such as GTest, JUnit, NUnit, or pytest, to define test cases, execute tests, and report results.

    - Test Cases
      > Unit testing requires a comprehensive set of test cases that cover all the possible scenarios and outcomes for the unit being tested.

    - Test Execution
      > Unit testing involves executing the test cases and analyzing the results to identify defects and issues.

##### 1.3.1.2. Integration Testing

Integration testing is a type of software testing that verifies the interactions and integration between different components or modules of a software application to ensure that they work together as expected. The purpose of integration testing is to identify defects and issues that may arise when different components are integrated and to ensure that the overall system functions as intended.

###### 1.3.1.2.1. Top-Down Integration Testing

Top-Down Integration Testing is an integration testing approach that focuses on testing the high-level modules or components of a software application first, and then gradually adds lower-level modules for testing. This approach is particularly useful when the high-level modules are well-defined and stable, while the lower-level modules are still under development.

1. Features and Benefits

    - Early Testing of High-Level Modules
      > Top-Down Integration Testing allows for early testing of high-level modules, which can help identify defects and issues early in the development cycle.

    - Incremental Testing
      > This approach allows for incremental testing of the application, which can help reduce the complexity of testing and improve the efficiency of the testing process.

    - Focus on Module Interactions
      > Top-Down Integration Testing focuses on testing the interactions between high-level modules and their interfaces, which can help identify any issues or defects that may arise from these interactions.

    - Stubs
      > Stubs are used to simulate the behavior of lower-level modules that are not yet developed, allowing for testing of high-level modules in isolation.

    - Comprehensive Test Cases
      > Top-Down Integration Testing requires a comprehensive set of test cases that cover all possible scenarios and outcomes for the high-level modules being tested.

###### 1.3.1.2.2. Bottom-Up Integration Testing

Bottom-Up Integration Testing is an integration testing approach that focuses on testing the lower-level modules or components of a software application first, and then gradually adds higher-level modules for testing. This approach is particularly useful when the lower-level modules are well-defined and stable, while the higher-level modules are still under development.

1. Features and Benefits

    - Early Testing of Lower-Level Modules
      > Bottom-Up Integration Testing allows for early testing of lower-level modules, which can help identify defects and issues early in the development cycle.

    - Incremental Testing
      > This approach allows for incremental testing of the application, which can help reduce the complexity of testing and improve the efficiency of the testing process.

    - Focus on Module Interactions
      > Bottom-Up Integration Testing focuses on testing the interactions between lower-level modules and their interfaces, which can help identify any issues or defects that may arise from these interactions.

    - Test Drivers
      > Test drivers are used to simulate the behavior of higher-level modules that are not yet developed, allowing for testing of lower-level modules in isolation.

    - Comprehensive Test Cases
      > Bottom-Up Integration Testing requires a comprehensive set of test cases that cover all possible scenarios and outcomes for the lower-level modules being tested.

##### 1.3.1.3. System Testing

System testing is a type of software testing that verifies the complete and integrated software application to ensure that it meets the specified requirements and functions as expected. The purpose of system testing is to validate the entire system as a whole, including all its components, modules, and interfaces.

1. Features and Benefits

    - End-to-End Testing
      > System testing involves testing the entire system from end to end, including all its components, modules, and interfaces.

    - Test Environment
      > System testing is typically performed in a test environment that simulates the production environment to ensure that the application performs as expected in a real-world environment.

    - Test Types
      > System testing can involve a variety of testing types, including functional testing, performance testing, security testing, usability testing, and others, depending on the application requirements.

    - Test Cases
      > System testing requires a comprehensive set of test cases that cover all the possible scenarios and outcomes for the entire system.

    - Test Execution
      > System testing involves executing the test cases and analyzing the results to identify defects and issues.

    - Defect Management
      > System testing requires effective defect management to track, prioritize, and resolve the defects and issues identified during testing.

##### 1.3.1.4. End-to-End (E2E) Testing

End-to-End (E2E) testing is a type of software testing that verifies the complete functionality of a software application from start to finish. The purpose of E2E testing is to ensure that the entire system works as expected and meets the specified requirements.

1. Features and Benefits

    - User Scenarios
      > E2E testing focuses on testing the entire user journey, from the initial interaction with the application to the final outcome.

    - Test Environment
      > E2E testing is typically performed in a test environment that simulates the production environment to ensure that the application performs as expected in a real-world environment.

    - Test Types
      > E2E testing can involve a variety of testing types, including functional testing, performance testing, security testing, usability testing, and others, depending on the application requirements.

    - Test Cases
      > E2E testing requires a comprehensive set of test cases that cover all the user scenarios and use cases.

    - Test Execution
      > E2E testing involves executing the test cases and analyzing the results to identify defects and issues.

    - Defect Management
      > E2E testing requires effective defect management to track, prioritize, and resolve the defects and issues identified during testing.

##### 1.3.1.5. Regression Testing

Regression testing is a type of software testing that is performed to ensure that changes or updates to the software do not introduce new defects or issues. The purpose of regression testing is to verify that the existing functionality of the software remains intact after changes have been made.

1. Features and Benefits

    - Test Selection
      > Regression testing involves selecting a subset of test cases that are relevant to the changes made to the software.

    - Test Automation
      > Regression testing can be automated using testing frameworks and tools to improve efficiency and reliability.

    - Continuous Integration
      > Regression testing is often integrated into the continuous integration (CI) process to ensure that changes are tested automatically as part of the development workflow.

    - Defect Detection
      > Regression testing helps to detect defects and issues that may have been introduced as a result of changes made to the software.

    - Risk Mitigation
      > Regression testing helps to mitigate the risk of introducing new defects or issues into the software, which can help to improve the overall quality of the software.

###### 1.3.1.5.1. Snapshot Testing

Snapshot testing is a type of regression testing that captures the output of a component, function, or system at a specific point in time and stores it as a `snapshot` reference. Subsequent test runs compare the current output against the stored snapshot to detect unintended changes.

> [!TIP]
> Snapshot testing is particularly useful for detecting regressions in complex outputs such as UI components, API responses, or serialized data.

1. Features and Benefits

    - Regression Detection
      > Quickly identifies unintended changes in output, ensuring that refactoring or new features do not break existing functionality.

    - Simplified Assertions
      > Reduces the need for writing complex assertions for large or complex data structures, as the entire output is compared against the snapshot.

    - Documentation
      > Snapshots serve as a form of documentation, showing the expected state or output of a component or function at a given point in time.

    - Efficiency
      > Speeds up the process of writing tests for components with complex rendering logic or large data outputs.

    - Ease of Use
      > Tests are simple to write and maintain, as they primarily involve capturing and comparing outputs without manually defining expected results.

2. Examples and Explanations

    - [Snapshot Testing with Jest](https://jestjs.io/docs/snapshot-testing)
      > In React development, snapshot testing is commonly used with tools like **Jest** to verify that a component renders correctly.

      ```javascript
      import renderer from 'react-test-renderer';
      import Link from '../Link';

      it('renders correctly', () => {
        const tree = renderer
          .create(<Link page="http://www.facebook.com">Facebook</Link>)
          .toJSON();
        expect(tree).toMatchSnapshot();
      });
      ```

      - First Run
        > On the first run, **Jest** creates a snapshot file (e.g., `__snapshots__/component.test.js.snap`) containing the expected output.

      - Subsequent Runs
        > On future runs, **Jest** compares the current output to the snapshot. If they differ, the test fails, prompting review of the changes.

      - Updating Snapshots
        > If changes are intentional, snapshots can be updated using `jest --updateSnapshot` to reflect the new expected output.

    - API Response Testing
      > Snapshot testing can also be used to verify API responses, ensuring that the structure and content of the response remain consistent.

      ```javascript
      it('returns the correct user data', async () => {
        const response = await fetchUserData(1);
        expect(response).toMatchSnapshot();
      });
      ```

##### 1.3.1.6. Acceptance Testing

Acceptance testing is a type of software testing that verifies whether a software application or system meets the specified requirements and is ready for deployment to a production environment. The purpose of acceptance testing is to ensure that the software meets the needs of the end-users and stakeholders and that it is fit for its intended purpose.

1. Features and Benefits

    - Requirement Validation
      > Acceptance testing ensures that the software meets the specified requirements and functions as expected, which helps reduce the risk of defects and issues in the final product.

    - User Involvement
      > Acceptance testing involves end-users and stakeholders in the testing process, which helps ensure that the software meets their needs and expectations.

    - Improved Quality
      > Acceptance testing helps improve the overall quality of the software by identifying and resolving issues before it is deployed to a production environment.

    - Reduced Risk
      > Acceptance testing helps reduce the risk of defects and issues in the final product by ensuring that the software meets the specified requirements and functions as expected.

    - Increased User Satisfaction
      > By involving end-users in the testing process, acceptance testing can help increase user satisfaction and loyalty.

###### 1.3.1.6.1. User Acceptance Testing

User Acceptance Testing (UAT) is a type of acceptance testing that is performed by the end-users or stakeholders of a software application or system. The purpose of UAT is to ensure that the software meets the business requirements and functions as expected in a real-world environment.

1. Features and Benefits

    - Real-world Testing
      > UAT allows end-users to test the software in a real-world environment, which helps identify any issues or bugs that may not have been detected during previous testing phases.

    - User Feedback
      > UAT provides an opportunity for end-users to provide feedback on the software, which can help improve its usability and functionality.

    - Business Requirements Validation
      > UAT ensures that the software meets the business requirements and functions as expected, which helps reduce the risk of defects and issues in the final product.

    - Increased User Satisfaction
      > By involving end-users in the testing process, UAT can help increase user satisfaction and loyalty.

    - Reduced Support Costs
      > Identifying and resolving issues during UAT can help reduce support costs by addressing potential problems before the software is deployed to a live environment.

###### 1.3.1.6.2. Operational Acceptance Testing

Operational Acceptance Testing (OAT) is a type of acceptance testing that focuses on verifying the operational readiness of a software application or system before it is deployed to a production environment. The purpose of OAT is to ensure that the software can be effectively operated, maintained, and supported in a live environment.

> [!NOTE]
> OAT typically involves testing various operational aspects of the software, including installation, configuration, backup and recovery, performance monitoring, security, and disaster recovery procedures. The goal is to ensure that the software can be deployed and operated smoothly in a production environment without any issues or disruptions.

1. Features and Benefits

    - Installation and Configuration
      > OAT verifies that the software can be installed and configured correctly in the production environment, ensuring that all necessary components and dependencies are in place.

    - Backup and Recovery
      > OAT tests the backup and recovery procedures to ensure that data can be restored in the event of a failure or disaster.

    - Performance Monitoring
      > OAT evaluates the performance monitoring capabilities of the software to ensure that it can be effectively monitored and managed in a live environment.

    - Security
      > OAT tests the security features of the software to ensure that it is protected against potential threats or attacks.

    - Disaster Recovery
      > OAT verifies the disaster recovery procedures to ensure that the software can be recovered quickly and effectively in the event of a disaster.

##### 1.3.1.7. Alpha Testing

Alpha testing is a type of software testing that is performed by the internal development team or a dedicated testing team within the organization. The purpose of alpha testing is to identify any issues or bugs in the software before it is released to a wider audience.

> [!NOTE]
> Alpha testing is typically conducted in a controlled environment, such as a test lab or staging environment, and is often supervised by a dedicated testing team or a representative from the software development team.

1. Features and Benefits

    - Early Bug Detection
      > Alpha testing allows for the identification and resolution of bugs and issues early in the development process, reducing the risk of defects in the final product.

    - Controlled Environment
      > Alpha testing is conducted in a controlled environment, allowing for better monitoring and management of the testing process.

    - Internal Feedback
      > Alpha testing provides an opportunity for internal stakeholders to provide feedback on the software, which can help improve its usability and functionality.

    - Cost-Effective
      > Identifying and resolving issues during alpha testing is generally more cost-effective than addressing them after the software has been released to a wider audience.

    - Improved Quality
      > Alpha testing helps improve the overall quality of the software by ensuring that it meets the specified requirements and functions as expected.

##### 1.3.1.8. Beta Testing

Beta testing is a type of software testing that is performed by a group of external users or customers who are not part of the development team. The purpose of beta testing is to identify any issues or bugs that may still exist in the software and to gather feedback from real-world users.

> [!NOTE]
> Beta testing is typically conducted after the software has undergone alpha testing and is considered to be stable enough for release to a wider audience.

1. Features and Benefits

    - Real-world testing
      > Beta testing allows the software to be tested in real-world scenarios, which can help identify issues that may not have been detected during alpha testing.

    - User feedback
      > Beta testing provides an opportunity for users to provide feedback on the software, which can help improve its usability and functionality.

    - Diverse user base
      > Beta testing involves a diverse group of users, which can help identify issues that may only affect certain demographics or user groups.

    - Increased reliability
      > Beta testing can help increase the reliability of the software by identifying and resolving issues before it is released to the general public.

    - Marketing opportunity
      > Beta testing can also serve as a marketing opportunity, as it allows users to experience the software before its official release and can generate buzz and excitement around the product.

##### 1.3.1.9. User Experience (UX) Testing

User experience (UX) testing is a type of software testing that focuses on evaluating the overall user experience of a software application or website. The purpose of UX testing is to ensure that the application or website is easy to use, intuitive, and meets the needs of the target audience.

1. Features and Benefits

    - User-Centered Design
      > UX testing helps ensure that the software application or website is designed with the user in mind, making it easier for users to navigate and use the application.

    - Improved User Experience
      > UX testing helps identify areas of the application or website that may be confusing or difficult to use, allowing developers to make improvements that enhance the overall user experience.

    - Increased User Satisfaction
      > By improving the usability of the software application or website, UX testing can help increase user satisfaction and loyalty.

    - Reduced Support Costs
      > UX testing can help reduce support costs by identifying and addressing usability issues before they become major problems for users.

    - Competitive Advantage
      > A well-designed and user-friendly software application or website can provide a competitive advantage in the marketplace, helping to attract and retain users.

###### 1.3.1.9.1. Usability Testing

Usability testing is a type of software testing that focuses on evaluating the user experience of a software application or website. The purpose of usability testing is to ensure that the application or website is easy to use, intuitive, and meets the needs of the target audience.

1. Features and Benefits

    - User-Centered Design
      > Usability testing helps ensure that the software application or website is designed with the user in mind, making it easier for users to navigate and use the application.

    - Improved User Experience
      > Usability testing helps identify areas of the application or website that may be confusing or difficult to use, allowing developers to make improvements that enhance the overall user experience.

    - Increased User Satisfaction
      > By improving the usability of the software application or website, usability testing can help increase user satisfaction and loyalty.

    - Reduced Support Costs
      > Usability testing can help reduce support costs by identifying and addressing usability issues before they become major problems for users.

    - Competitive Advantage
      > A well-designed and user-friendly software application or website can provide a competitive advantage in the marketplace, helping to attract and retain users.

###### 1.3.1.9.2. Cross-Browser Testing

Cross-browser testing is a type of software testing that involves testing a web application or website across different web browsers to ensure that it functions correctly and consistently across all supported browsers. The purpose of cross-browser testing is to identify and resolve any compatibility issues that may arise due to differences in how different browsers interpret and render web content.

1. Features and Benefits

    - Browser Compatibility
      > Cross-browser testing ensures that the web application or website is compatible with different web browsers, including popular browsers such as Chrome, Firefox, Safari, and Edge.

    - Consistent User Experience
      > Cross-browser testing helps ensure that the user experience is consistent across different browsers, providing a seamless experience for users regardless of the browser they are using.

    - Bug Detection
      > Cross-browser testing helps identify and resolve any bugs or issues that may arise due to differences in how different browsers interpret and render web content.

    - Increased Reach
      > Cross-browser testing helps increase the reach of the web application or website by ensuring that it is accessible to users on different browsers.

    - Improved SEO
      > Cross-browser testing can help improve the search engine optimization (SEO) of the web application or website by ensuring that it is optimized for different browsers and devices.

###### 1.3.1.9.3. Compatibility Testing

Compatibility testing is a type of software testing that evaluates how well a software application or system works across different environments, platforms, devices, and configurations. The purpose of compatibility testing is to ensure that the software application or system functions correctly and consistently across all supported environments.

1. Features and Benefits

    - Environment Compatibility
      > Compatibility testing ensures that the software application or system is compatible with different operating systems, browsers, and hardware configurations.

    - Device Compatibility
      > Compatibility testing helps ensure that the software application or system works correctly on different devices, such as desktops, laptops, tablets, and smartphones.

    - Configuration Compatibility
      > Compatibility testing evaluates how well the software application or system works with different configurations, such as different versions of software libraries or frameworks.

    - User Experience
      > Compatibility testing helps ensure that the user experience is consistent across different environments and devices, providing a seamless experience for users.

    - Bug Detection
      > Compatibility testing helps identify and resolve any bugs or issues that may arise due to differences in how the software application or system interacts with different environments and configurations.

###### 1.3.1.9.4. Accessibility Testing

Accessibility testing is a type of software testing that focuses on evaluating the accessibility of a software application or website for users with disabilities. The purpose of accessibility testing is to ensure that the application or website can be used by all users, regardless of their physical or cognitive abilities.

1. Features and Benefits

    - Inclusivity
      > Accessibility testing ensures that the software application or website is inclusive and can be used by all users, including those with disabilities.

    - Compliance
      > Accessibility testing helps ensure that the software application or website complies with accessibility standards and guidelines, such as the Web Content Accessibility Guidelines (WCAG).

    - Improved User Experience
      > Accessibility testing helps improve the overall user experience of the software application or website by making it easier to use for all users.

    - Increased Reach
      > Accessibility testing helps increase the reach of the software application or website by making it accessible to a wider audience, including users with disabilities.

    - Legal Protection
      > Accessibility testing helps protect against legal action related to accessibility issues, as many countries have laws and regulations that require software applications and websites to be accessible to users with disabilities.

##### 1.3.1.10. Sanity Testing

Sanity testing is a type of software testing that is performed to verify that a specific functionality or feature of a software application is working as expected after a change or modification has been made to the application. The purpose of sanity testing is to ensure that the changes made to the application have not introduced any new defects or issues and that the application is still functioning correctly.

1. Features and Benefits

    - Focused Scope
      > Sanity testing focuses on specific functionalities or features that have been modified or added, rather than testing the entire application. This allows for a more efficient and targeted testing approach.

    - Quick Feedback
      > Sanity testing provides quick feedback on the stability of the application after changes have been made. This allows developers to identify and address any issues before proceeding with more comprehensive testing.

    - Early Defect Detection
      > Sanity testing helps identify defects early in the development cycle, allowing developers to address them before they become more complex and difficult to fix.

    - Reduced Testing Time
      > By focusing on specific functionalities or features, sanity testing can help reduce the overall testing time and effort required for more comprehensive testing.

    - Improved Quality
      > Sanity testing helps improve the overall quality of the software application by ensuring that critical functionalities are working correctly after changes have been made.

##### 1.3.1.11. Smoke Testing

Smoke testing, also known as **build verification testing**, is a type of software testing that is performed to determine whether the most critical functions of a software application are working correctly after a new build or release. The purpose of smoke testing is to quickly identify any major issues or defects in the software that may prevent further testing or development.

1. Features and Benefits

    - Quick Feedback
      > Smoke testing provides quick feedback on the stability of the software application, allowing developers to identify and address any major issues before proceeding with further testing or development.

    - Early Defect Detection
      > Smoke testing helps identify critical defects early in the development cycle, allowing developers to address them before they become more complex and difficult to fix.

    - Reduced Testing Time
      > By focusing on the most critical functions of the software application, smoke testing can help reduce the overall testing time and effort required for more comprehensive testing.

    - Improved Quality
      > Smoke testing helps improve the overall quality of the software application by ensuring that the most critical functions are working correctly before proceeding with further testing or development.

##### 1.3.1.12. Exploratory Testing

Exploratory testing is a type of software testing that involves simultaneous learning, test design, and test execution. It is an informal and unscripted approach to testing that emphasizes the tester's creativity, intuition, and experience in exploring the software application to identify potential issues and defects.

1. Features and Benefits

    - Flexibility
      > Exploratory testing allows testers to adapt their testing approach based on their observations and findings during the testing process. This flexibility enables testers to explore different areas of the application and uncover issues that may not be covered by scripted tests.

    - Creativity
      > Exploratory testing encourages testers to think creatively and use their intuition to identify potential issues and defects in the software application. This approach allows testers to explore different scenarios and use cases that may not be covered by traditional testing methods.

    - Rapid Feedback
      > Exploratory testing provides rapid feedback on the quality of the software application, allowing testers to quickly identify and report issues and defects. This feedback can be used to improve the software application and enhance its overall quality.

    - User-Centric Approach
      > Exploratory testing focuses on understanding the user's perspective and experience with the software application. Testers can simulate real-world usage scenarios and identify issues that may impact the user's experience.

##### 1.3.1.13. A/B Testing

A/B testing, also known as split testing, is a type of software testing that involves comparing two versions of a product or service to determine which one performs better. The goal of A/B testing is to identify the version that is more effective in achieving a specific objective, such as increasing conversion rates, improving user engagement, or reducing bounce rates.

1. Features and Benefits

    - Controlled Experimentation
      > A/B testing allows for controlled experimentation by randomly assigning users to different versions of a product or service. This helps isolate the impact of specific changes and provides reliable data for decision-making.

    - Data-Driven Decision Making
      > A/B testing provides quantitative data on user behavior and preferences, enabling businesses to make informed decisions based on actual user interactions rather than assumptions or opinions.

    - Incremental Improvements
      > A/B testing allows for incremental improvements by testing small changes to a product or service. This iterative approach helps optimize user experience and performance over time.

    - Risk Mitigation
      > By testing changes on a subset of users before rolling them out to the entire user base, A/B testing helps mitigate risks associated with implementing new features or design changes.

    - User-Centric Approach
      > A/B testing focuses on understanding user preferences and behaviors, allowing businesses to tailor their products or services to better meet the needs of their target audience.

##### 1.3.1.14. Monkey Testing

Monkey testing is a type of software testing that involves providing random inputs to a software application in order to test its behavior and identify potential issues or weaknesses. Monkey testing simulates real-world usage scenarios and uncovers any unexpected behavior or crashes that may occur when the application is subjected to random inputs.

> [!NOTE]
> **Chaos Engineering** is a related concept that involves intentionally introducing failures and disruptions into a system to test its resilience and ability to recover from unexpected events.

1. Features and Benefits

    - Uncovering Edge Cases
      > Monkey testing can help uncover edge cases and unexpected behavior that may not be covered by traditional testing methods. By providing random inputs, monkey testing can reveal defects and issues that may not have been anticipated during the development process.

    - Stress Testing
      > Monkey testing can be used as a form of stress testing to evaluate the application's performance and stability under extreme conditions. By subjecting the application to random inputs, monkey testing can help identify performance bottlenecks and other issues that may arise under heavy usage.

    - Cost-Effective
      > Monkey testing is a cost-effective way to test a software application, as it requires minimal setup and can be automated using tools and frameworks. This makes it an efficient way to identify potential issues and defects in the application.

    - Increased Test Coverage
      > Monkey testing can help increase test coverage by exploring a wide range of input scenarios and use cases. This can help ensure that the application is thoroughly tested and that potential issues are identified and addressed.

    - Improved Quality
      > By identifying and addressing potential issues and defects, monkey testing can help improve the overall quality of the software application. This can lead to increased user satisfaction and loyalty.

#### 1.3.2. Non-Functional Testing

Non-functional testing is a type of software testing that focuses on evaluating the non-functional aspects of a software application, such as performance, security, usability, and reliability. The purpose of non-functional testing is to ensure that the software meets the specified non-functional requirements and performs as expected under various conditions.

##### 1.3.2.1. Security Testing

Security testing is a type of software testing that focuses on identifying and addressing security vulnerabilities and weaknesses in a system or application. The goal of security testing is to ensure that the system is secure from potential attacks and threats, such as data breaches, unauthorized access, or theft.

###### 1.3.2.1.1. Penetration Testing

This involves simulating a real-world attack on the system to identify any vulnerabilities or weaknesses that could be exploited by attackers.

1. Features and Benefits

    - Vulnerability Identification
      > Penetration testing helps identify vulnerabilities in the system that could be exploited by attackers. By simulating real-world attacks, penetration testers can uncover weaknesses in the system's defenses and provide recommendations for improving security.

    - Risk Assessment
      > Penetration testing provides a risk assessment of the system by identifying potential threats and vulnerabilities. This information can be used to prioritize security efforts and allocate resources effectively.

    - Compliance
      > Penetration testing is often required for compliance with industry regulations and standards, such as PCI DSS, HIPAA, and ISO 27001. By conducting regular penetration tests, organizations can demonstrate their commitment to security and compliance.

    - Improved Security Posture
      > Penetration testing helps improve the overall security posture of the organization by identifying and addressing vulnerabilities before they can be exploited by attackers.

###### 1.3.2.1.2. Fuzz Testing

Fuzz testing, also known as fuzzing, is a software testing technique that involves providing invalid, unexpected, or random data as input to a computer program. The goal of fuzz testing is to identify vulnerabilities and weaknesses in the software that could be exploited by attackers.

1. Features and Benefits

    - Identification of Unknown Vulnerabilities
      > Fuzz testing excels at finding edge cases or unknown vulnerabilities that might not be detected by traditional testing methods. By inputting random or semi-random data into software, fuzzing reveals defects such as buffer overflows, crashes, and memory leaks.

    - Enhanced Code Coverage
      > Fuzzers uncover edge cases that human testers may not anticipate. This contributes to more comprehensive test coverage, ensuring that obscure paths and conditions in the code are tested.

    - Cost-Effective Debugging
      > Fuzzing operates autonomously, it can significantly reduce the manual effort required for testing, especially for complex input-handling logic. This leads to cost savings in the debugging and verification phases of the software lifecycle.

2. Tools and Frameworks

    - [Google FuzzTest](https://github.com/google/fuzztest)
      > Google FuzzTest is a C++ testing framework for writing and executing fuzz tests based on property tests execution using coverage-guided fuzzing.

3. Examples and Explanations

    Fuzz Testing using `Google FuzzTest` to effective automate the process of testing functions for edge cases and unexpected behavior.

    - calculator.h
      > The `Calculator` class with two member functions `Add()` and `Subtract()`.

      ```cpp
      #pragma once

      class Calculator {
      public:
          int Add(int a, int b);
          int Subtract(int a, int b);
      };
      ```

    - calculator.cpp

      ```cpp
      #include "calculator.h"

      int Calculator::Add(int a, int b) {
          return a + b;
      }

      int Calculator::Subtract(int a, int b) {
          return a - b;
      }
      ```

    - `calculator_fuzz_test.cpp`
      > This file contains the fuzzing logic using `Google FuzzTest` and tests the `Add()` and `Subtract()` functions of the Calculator class.

      ```cpp
      #include <fuzztest/fuzztest.h>

      #include "calculator.h"

      void FuzzAddFunction(int a, int b) {
          Calculator calc;
          calc.Add(a, b);
      }

      void FuzzSubtractFunction(int a, int b) {
          Calculator calc;
          calc.Subtract(a, b);
      }

      FUZZ_TEST(FuzzAddFunction);
      FUZZ_TEST(FuzzSubtractFunction);
      ```

      - Test Functions
        > The test functions `FuzzAddFunction()` and `FuzzSubtractFunction()` take integer inputs and invoke the corresponding `Add()` and `Subtract()` methods of the Calculator class.

      - Test Marcos
        > The test functions are registered as fuzz tests using the `FUZZ_TEST` macro.

##### 1.3.2.2. Application Security Testing

Application security testing is a type of software testing that focuses on identifying and addressing security vulnerabilities and weaknesses in an application. The goal of application security testing is to ensure that the application is secure from potential attacks and threats, such as data breaches, unauthorized access, or theft.

###### 1.3.2.2.1. Static Application Security Testing (SAST)

Static Application Security Testing (SAST) is a type of application security testing that analyzes the source code of an application to identify potential security vulnerabilities and coding errors. SAST tools typically use automated scanners to analyze the code and identify potential security issues, such as buffer overflows, SQL injection, cross-site scripting (XSS), and other common vulnerabilities.

1. Features and Benefits

    - Code Analysis
      > SAST tools analyze the source code of an application to identify potential security vulnerabilities and coding errors.

    - Early Detection
      > SAST can be performed early in the development process, allowing developers to identify and address security issues before they become more difficult and costly to fix.

    - Automated Testing
      > SAST tools use automated scanners to identify potential security vulnerabilities, which can help improve the efficiency and effectiveness of the testing process.

    - Comprehensive Coverage
      > SAST can analyze the entire codebase of an application, providing comprehensive coverage of potential security issues.

    - Integration with Development Tools
      > SAST tools can integrate with development tools, such as IDEs and build servers, to provide developers with easy access to security feedback.

###### 1.3.2.2.2. Dynamic Application Security Testing (DAST)

Dynamic Application Security Testing (DAST) is a type of application security testing that analyzes a running application to identify potential security vulnerabilities and weaknesses. DAST tools typically use automated scanners to simulate real-world attack scenarios and identify potential vulnerabilities in the application's runtime behavior.

1. Features and Benefits

    - Runtime Analysis
      > DAST tools analyze the runtime behavior of an application to identify potential security vulnerabilities and weaknesses.

    - Real-World Simulation
      > DAST simulates real-world attack scenarios to identify potential vulnerabilities that may not be detected through static analysis alone.

    - Automated Testing
      > DAST tools use automated scanners to identify potential security vulnerabilities, which can help improve the efficiency and effectiveness of the testing process.

    - Comprehensive Coverage
      > DAST can analyze the entire application, including its interactions with external systems and services, providing comprehensive coverage of potential security issues.

    - Integration with Development Tools
      > DAST tools can integrate with development tools, such as CI/CD pipelines, to provide developers with easy access to security feedback.

###### 1.3.2.2.3. Interactive Application Security Testing (IAST)

Interactive Application Security Testing (IAST) is a type of application security testing that combines elements of both SAST and DAST to provide a more comprehensive approach to identifying and addressing security vulnerabilities in an application. IAST tools typically use agents that are installed within the application to monitor its behavior and identify potential security issues in real-time.

1. Features and Benefits

    - Hybrid Approach
      > IAST combines elements of both SAST and DAST to provide a more comprehensive approach to identifying and addressing security vulnerabilities in an application.

    - Real-Time Monitoring
      > IAST tools use agents that are installed within the application to monitor its behavior and identify potential security issues in real-time.

    - Automated Testing
      > IAST tools use automated scanners to identify potential security vulnerabilities, which can help improve the efficiency and effectiveness of the testing process.

    - Comprehensive Coverage
      > IAST can analyze the entire application, including its interactions with external systems and services, providing comprehensive coverage of potential security issues.

    - Integration with Development Tools
      > IAST tools can integrate with development tools, such as CI/CD pipelines, to provide developers with easy access to security feedback.

##### 1.3.2.3. Performance Testing

Performance testing is a type of software testing that focuses on evaluating the performance and scalability of a software application or system under various conditions. The purpose of performance testing is to ensure that the software meets the specified performance requirements and performs as expected under different workloads and usage scenarios.

1. Features and Benefits

    - Load Handling
      > Performance testing evaluates how well the software application or system can handle different levels of user load and traffic.

    - Scalability
      > Performance testing assesses the scalability of the software application or system, ensuring that it can handle increased workloads and user demand.

    - Response Time
      > Performance testing measures the response time of the software application or system, ensuring that it meets the specified performance requirements.

    - Resource Utilization
      > Performance testing evaluates the resource utilization of the software application or system, ensuring that it uses resources efficiently and effectively.

    - Bottleneck Identification
      > Performance testing helps identify performance bottlenecks and other issues that may impact the overall performance of the software application or system.

###### 1.3.2.3.1. Load Testing

Load testing involves testing the system under expected or anticipated user load to evaluate its performance and behavior under normal conditions.

###### 1.3.2.3.2. Stress Testing

Stress testing involves testing the system beyond its normal operational capacity to evaluate its ability to handle extreme conditions and recover from failures.

###### 1.3.2.3.3. Endurance Testing

Endurance testing, also known as soak testing, involves testing the system's performance and stability over an extended period of time under a normal or expected load.

###### 1.3.2.3.4. Spike Testing

Spike testing involves testing the system's ability to handle sudden and extreme increases in user load or traffic.

###### 1.3.2.3.5. Volume Testing

Volume testing involves testing the system's ability to handle large volumes of data or transactions within a defined period.

###### 1.3.2.3.6. Scalability Testing

Scalability testing involves testing the system's ability to scale up or down in response to changes in user load or demand.

###### 1.3.2.3.7. Capacity Testing

Capacity testing involves testing the system's ability to handle a specific capacity or volume of users, requests, or transactions.

## 2. Terminology

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

## 3. References

- RedHat [Shift-Left vs Shift-Right](https://www.redhat.com/en/topics/devops/shift-left-vs-shift-right) page.
