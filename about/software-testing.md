# Software Testing

Software testing is an organizational process within software development in which business-critical software is verified for correctness, quality, and performance. Software testing is used to ensure that expected business systems and product features behave correctly as expected.

- [Functional Testing](#functional-testing)
  - [Unit Testing](#unit-testing)
  - [Integration Testing](#integration-testing)
  - [System Testing](#system-testing)
  - [Regression Testing](#regression-testing)
  - [End-to-End Testing](#end-to-end-testing)
  - [Acceptance Testing](#acceptance-testing)
  - [API Testing](#api-testing)
  - [UI Testing](#ui-testing)
- [Non-Functional Testing](#non-functional-testing)
  - [Reliability Testing](#reliability-testing)
  - [Performance Testing](#performance-testing)
  - [Security Testing](#security-testing)
  - [Compliance Testing](#compliance-testing)
- [Test Box](#test-box)
  - [White Box Testing](#white-box-testing)
  - [Black Box Testing](#black-box-testing)
  - [Gray Box Testing](#gray-box-testing)
- [Test Design](#test-design)
  - [Test Driven Development](#test-driven-development)
  - [Behavioral Driven Development](#behavioral-driven-development)
  - [Acceptance Test-Driven Development](#acceptance-test-driven-development)
- [Mock Object](#mock-object)
- [Test Fixture](#test-fixture)
- [Fuzzing](#fuzzing)
- [Penetration Testing](#penetration-testing)
- [See also](#see-also)

## Functional Testing

Functional testing is a type of software testing in which the system is tested against the functional requirements and specifications. Functional testing ensures that the requirements or specifications are properly satisfied by the application.

### Unit Testing

Unit tests are low level, close to the source of the application. They consist in testing individual methods and functions of the classes, components or modules used by your software.

### Integration Testing

Integration tests verify that different modules or services used by your application work well together.

### System Testing

System testing is testing conducted on a complete integrated system to evaluate the system's compliance with its specified requirements.

### Regression Testing

Performed after vulnerability remediation, version updates, or types of system upgrades and maintenance. Regression testing verifies that a code change in the software does not have an impact on the existing functionality of the product.

### End-to-End Testing

End-to-end (E2E) testing replicates a user behavior with the software in a complete application environment. It verifies that various user flows work as expected and can be as loading a web page or logging in or verifying email notifications, online payments.

### Acceptance Testing

Acceptance tests are formal tests executed to verify if a system satisfies its business requirements. They require the entire application to be up and running and focus on replicating user behaviors. Additionally, the acceptance tests are derived from the user story and are based on the acceptance criteria. But they can also go further and measure the performance of the system and reject changes if certain goals are not met.

### API Testing

API testing is a type of software testing that involves testing application programming interfaces (APIs) directly and as part of integration testing to determine if they meet expectations for functionality, reliability, performance, and security. Since APIs lack a UI, API testing is performed at the message layer. API testing is now considered critical for automating testing because APIs now serve as the primary interface to application logic and because UI tests are difficult to maintain with the short release cycles and frequent changes commonly used with Agile software development and DevOps.

### UI Testing

User interface (UI) testing is the process of testing the visual elements of an application to validate whether they accurately meet the expected performance and functionality.

## Non-Functional Testing

Non-functional testing involves testing the non-functional features of a software application that are not tested in functional testing.

### Reliability Testing

Reliability testing assures that the product is fault free and is reliable for its intended purpose. It is about exercising an application failures are discovered before the system is deployed.

### Performance Testing

Performance tests check the behaviors of the system when it is under significant load. These tests are non-functional and can have the various form to understand the reliability, stability, and availability of the platform. For instance, it can be observing response times when executing a high number of requests, or seeing how the system behaves with a significant of data.

Types of Performance testing:

- `Load testing`
  > Type of performance testing conducted to evaluate the behavior of a system at an increasing workload.

- `Stress testing`
  > Type of performance testing conducted to evaluate the behavior of a system at or beyond the limits of its anticipated workload.

- `Endurance testing`
  > Type of performance testing conducted to evaluate the behavior of a system when a significant workload is given continuously.

- `Spike testing`
  > Type of performance testing conducted to evaluate the behavior of a system when the load is suddenly and substantially increased.

### Security Testing

Security testing is a non-functional software testing technique used to determine if the information and data in a system is protected. The goal is to purposefully find loopholes and security risks in the system that could result in unauthorized access to or the loss of information by probing the application for weaknesses.

### Compliance Testing

Compliance testing verifies that the product meets international standards of software development, usually developed by global companies.

## Test Box

### White Box Testing

[White box testing](https://www.whitesourcesoftware.com/resources/blog/white-box-testing/) is an approach that involves testing an application based on knowledge of its inner workings, code, and architecture.

Types of White Box Testing:

- Unit testing
- Integration testing
- Regression testing

### Black Box Testing

Black box testing evaluates a product from the user’s perspective, with no knowledge of its inner workings. Therefore it is an end-to-end approach that tests all systems that impact the end-user, including UI/UX, web servers, database, and integrated systems.

Types of Black Box Testing:

- Functional testing
- Non-functional testing
- Regression testing

### Gray Box Testing

[Grey box testing](https://www.imperva.com/learn/application-security/gray-box-testing/) combines black box and white box testing. The tests are performed from the user's perspective, with some inside information to focus on the most important issues and identify the weaknesses of the system.

Types of Gray Box Testing:

- Functional testing
- Non-functional testing
- Regression testing

## Test Design

### Test Driven Development

Test-driven development (TDD) is a software development process relying on software requirements being converted to test cases before software is fully developed, and tracking all software development by repeatedly testing the software against all test cases.

TDD defines a process in which the developer writes tests before writing code. It follows a cycle of `red` > `green` > `refactor`.

### Behavioral Driven Development

Behavioral-Driven Development (BDD) is a testing approach derived from the Test-Driven Development (TDD) methodology. In BDD, tests are mainly based on systems behavior. This approach defines various ways to develop a feature based on its behavior.

In BDD the business expert defines tests. They can drive development through writing tests that express their intent while providing clear direction for developers. Write requirements using `given`, `when`, and `then` keywords to separate out segments of the sentence.

`Given` username of  _user_ and password of _password_, `when` the login button is pressed, `then` the user is sent to the home screen.

### Acceptance Test-Driven Development

In Acceptance Test-Driven Development (ATDD) technique, a single acceptance test is written from the user’s perspective. It mainly focuses on satisfying the functional behavior of the system and capturing the accurate requirements.

## Mock Object

[Mock objects](https://code-craftsmanship-saturdays.gitbook.io/software-testing-fundamentals/mocking) are simulated objects that mimic the behavior of real objects in a controlled manner.

## Test Fixture

[Test fixture](https://code-craftsmanship-saturdays.gitbook.io/software-testing-fundamentals/test-fixtures) is used as environment to consistently test item, device, or piece of software. Test fixtures initialize test functions. They provide a fixed baseline so that tests execute reliably and produce consistent, repeatable, results. Initialization may setup services, state, or other operating environments.

## Fuzzing

[Fuzz testing](https://www.synopsys.com/glossary/what-is-fuzz-testing.html) or fuzzing is an automated black box software testing method that injects invalid, malformed, or unexpected inputs into a system to reveal software defects and vulnerabilities. Fuzzing is a type of automated testing which continuously manipulates inputs to a program to find issues such as bugs or vulnerabilities to which the code may be susceptible.

## Penetration Testing

[Penetration testing](https://www.imperva.com/learn/application-security/penetration-testing) or pen test, is a simulated cyber attack against your computer system to check for exploitable vulnerabilities. In the context of web application security, penetration testing is commonly used to augment a web application firewall (WAF).

## See also

- Atlassian [Software Testing](https://www.atlassian.com/continuous-delivery/software-testing/types-of-software-testing) article.
- Smartbear [Software Testing Methodologies](https://smartbear.com/learn/automated-testing/software-testing-methodologies/) article.
- BrowserStack [BDD vs TDD vs ATDD](https://www.browserstack.com/guide/tdd-vs-bdd-vs-atdd) article.
- LinkedIn [TDD vs. ATDD vs. BDD](https://www.linkedin.com/pulse/tdd-vs-atdd-bdd-vahid-farahmandian) article.
- Cprime [TDD vs. ATDD vs. BDD](https://www.cprime.com/resources/blog/tdd-vs-bdd-vs-atdd/) article.
- OWASP [Fuzzing](https://owasp.org/www-community/Fuzzing) article.
