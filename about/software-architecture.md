# Software Architecture

Software architecture refers to the fundamental structures of a software system and the discipline of creating such structures and systems. Each structure comprises software elements, relations among them, and properties of both elements and relations.

- [Microservices Architecture](#microservices-architecture)
- [Clean Architecture](#clean-architecture)
- [Onion Architecture](#onion-architecture)
- [Hexagonal Architecture](#hexagonal-architecture)
- [See also](#see-also)

## Microservices Architecture

[Microservices](https://microservices.io/) style leverages the ideology of developing a single application as a suite of small, narrowly focused, independently deployable services. Each microservice runs in its own process and communicates with a lightweight mechanism, often an HTTP resource API. Those services are encapsulated for specific business capabilities and are deployed independently using a fully automated mechanism.

However, microservices, which build on the principles of SOA, are now a reality with the introduction of new technologies, which constitute the three main building blocks of a microservices architecture. With those building blocks readily available and established, the following benefits emerge:

- Containers: Software containers have created a standardized frame for all services by abstracting the core OS code from the underlying hardware.  The standardization offered by containers eliminates what was once a painful integration process in a heterogeneous infrastructure world. Thanks to vendors such as Docker, containers have revolutionized how developers build and deploy applications.
- APIs: The adoption and increased capabilities offered by APIs has created a robust and standardized format for communications between applications, services and servers. REST (Representation State Transfer) APIs in particular are key to microservices architecture. A RESTful API breaks down a transaction to create a series of small modules, each of which addresses a particular underlying part of the transaction. This modularity provides developers with a lot of flexibility for developing lightweight APIs, which are more suitable for browser powered applications.

The business logic for the microservices can be organized using [Domain-Driven Design (DDD)](https://martinfowler.com/tags/domain%20driven%20design.html). Based on the DDD model, an onion, hexagonal or clean architecture can be created.

## Clean Architecture

[Clean Architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html) was introduced by Robert Martin (aka Uncle Bob) in 2012. It builds on the concepts of Onion Architecture but with somewhat different details of the layers. Instead of “Domain Model”, it refers to the core as “Entities”, but still representing enterprise-wide business rules.

Clean Architecture adds on the concept of “Screaming Architecture” which at its heart is basically the idea that it should be glaringly obvious at a glance what an application does. In general, if you glance at an app, you can tell that’s its implemented as a web app, but it might take some digging to uncover the actual business process which it performs.

Clean Architecture re-phrases “Application Services” as “Use Cases” and puts these use cases front-and center in the application making it screamingly clear what the application actually does. Like ports-and-adapters and onion architecture, clean architecture externalizes the implementation details of how it will connect to the outside world (I.E. UI, databases, etc) to the edges of the architecture.

## Onion Architecture

[Onion Architecture](https://jeffreypalermo.com/2008/07/the-onion-architecture-part-1/) was introduced by Jeffrey Palermo in 2008. It expanded on the idea to define a “Core” within the application and various layers surrounding it. The core “Domain Model” represents enterprise-wide business rules. In the next layer up are “Domain Services” such as abstract repositories (still leaving the implementation details such as a database connection to the outer layers). Further up is “Application Services” which defined the business processes of the application. In the outer-most layer are the user interface, connections to external infrastructure, and automated tests. Like ports-and-adapters, this pattern leaves the connections to all external dependencies such as databases, APIs, and user interfaces at the edge so they can be easily switched out.

## Hexagonal Architecture

[Hexagonal Architecture](https://alistair.cockburn.us/hexagonal-architecture/) was introduced by Alistair Cockburn in 2005. The most bare bones application of the principal is Hexagonal or Ports and Adapters architecture. Confusingly, the pattern really has nothing to do with hexagons, it’s just how it’s usually drawn. The fact that it has 6 sides is arbitrary.

The concept behind Hexagonal Architecture is that your core application logic is written with only a concept of whatever external dependencies it has. In object-oriented terms this means it declares and references and interface, but leaves the implementation of that interface out of the core logic. This can be thought of as a “port” such a display port or USB port. The outer layer of the application then creates an “adapter” which plugs into the port, so if there was a database port, the adapter would plug into that port and provide a connection to a particular database. If you wanted to switch databases, you could just write a new adapter. User interfaces would also be ports which could be filled with various adapters without modifying the core logic.

## See also

- Google [introduction to microservices](https://cloud.google.com/architecture/microservices-architecture-introduction?hl=en) article.
- Medium [Onion vs Clean vs Hexagonal Architecture](https://medium.com/@edamtoft/onion-vs-clean-vs-hexagonal-architecture-9ad94a27da91) article.
