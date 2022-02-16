# Software Test

- [Software Testing](#software-testing)
  - [Unit Testing](#unit-testing)
  - [Integration Testing](#integration-testing)
  - [Functional Testing](#functional-testing)
  - [Acceptance Testing](#acceptance-testing)
  - [Performance Testing](#performance-testing)
  - [Security Testing](#security-testing)
- [Test Design](#test-design)
  - [Test Driven Development](#test-driven-development)
  - [Behavioral Driven Development](#behavioral-driven-development)
  - [Acceptance Test-Driven Development](#acceptance-test-driven-development)
- [See also](#see-also)

## Software Testing

Software testing is an organizational process within software development in which business-critical software is verified for correctness, quality, and performance. Software testing is used to ensure that expected business systems and product features behave correctly as expected.

### Unit Testing

Unit tests are low level, close to the source of the application. They consist in testing individual methods and functions of the classes, components or modules used by your software.

### Integration Testing

Integration tests verify that different modules or services used by your application work well together.

### Functional Testing

Functional tests focus on the business requirements of an application. They only verify the output of an action and do not check the intermediate states of the system when performing that action.

### Acceptance Testing

Acceptance tests are formal tests executed to verify if a system satisfies its business requirements. They require the entire application to be up and running and focus on replicating user behaviors. But they can also go further and measure the performance of the system and reject changes if certain goals are not met.

### Performance Testing

Performance tests check the behaviors of the system when it is under significant load. These tests are non-functional and can have the various form to understand the reliability, stability, and availability of the platform. For instance, it can be observing response times when executing a high number of requests, or seeing how the system behaves with a significant of data.

### Security Testing

Security testing is a non-functional software testing technique used to determine if the information and data in a system is protected. The goal is to purposefully find loopholes and security risks in the system that could result in unauthorized access to or the loss of information by probing the application for weaknesses.

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

## See also

- Atlassian [Software Testing](https://www.atlassian.com/continuous-delivery/software-testing/types-of-software-testing) article.
- Smartbear [Software Testing Methodologies](https://smartbear.com/learn/automated-testing/software-testing-methodologies/) article.
- BrowserStack [BDD vs TDD vs ATDD](https://www.browserstack.com/guide/tdd-vs-bdd-vs-atdd) article.
- LinkedIn [TDD vs. ATDD vs. BDD](https://www.linkedin.com/pulse/tdd-vs-atdd-bdd-vahid-farahmandian) article.
- Cprime [TDD vs. ATDD vs. BDD](https://www.cprime.com/resources/blog/tdd-vs-bdd-vs-atdd/) article.
