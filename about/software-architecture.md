# Software Architecture

Software architecture refers to the fundamental structures of a software system and the discipline of creating such structures and systems. Each structure comprises software elements, relations among them, and properties of both elements and relations.

- [1. Clean Architecture](#1-clean-architecture)
- [2. Onion Architecture](#2-onion-architecture)
- [3. Hexagonal Architecture](#3-hexagonal-architecture)
- [4. Emergent Architecture](#4-emergent-architecture)
- [5. See also](#5-see-also)

## 1. Clean Architecture

[Clean Architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html) was introduced by Robert Martin (aka Uncle Bob) in 2012. Clean architecture attempts to provide a cost-effective method for developing quality code that is changeable and has fewer dependencies.

Clean architecture is a software design philosophy that separates the elements of a design into ring levels. An important goal of clean architecture is to provide developers with a way to organize code in such a way that it encapsulates the business logic but keeps it separate from the delivery mechanism.

The main rule of clean architecture is that code dependencies can only move from the outer levels inward. Code on the inner layers can have no knowledge of functions on the outer layers. The variables, functions and classes (any entities) that exist in the outer layers can not be mentioned in the more inward levels. It is recommended that data formats also stay separate between levels.

## 2. Onion Architecture

[Onion Architecture](https://jeffreypalermo.com/2008/07/the-onion-architecture-part-1/) was introduced by Jeffrey Palermo in 2008. It expanded on the idea to define a “Core” within the application and various layers surrounding it. The core “Domain Model” represents enterprise-wide business rules. In the next layer up are “Domain Services” such as abstract repositories (still leaving the implementation details such as a database connection to the outer layers). Further up is “Application Services” which defined the business processes of the application. In the outer-most layer are the user interface, connections to external infrastructure, and automated tests. Like ports-and-adapters, this pattern leaves the connections to all external dependencies such as databases, APIs, and user interfaces at the edge so they can be easily switched out.

## 3. Hexagonal Architecture

[Hexagonal Architecture](https://alistair.cockburn.us/hexagonal-architecture/) was introduced by Alistair Cockburn in 2005. The most bare bones application of the principal is Hexagonal or Ports and Adapters architecture. Confusingly, the pattern really has nothing to do with hexagons, it’s just how it’s usually drawn. The fact that it has 6 sides is arbitrary.

The concept behind Hexagonal Architecture is that your core application logic is written with only a concept of whatever external dependencies it has. In object-oriented terms this means it declares and references and interface, but leaves the implementation of that interface out of the core logic. This can be thought of as a “port” such a display port or USB port. The outer layer of the application then creates an “adapter” which plugs into the port, so if there was a database port, the adapter would plug into that port and provide a connection to a particular database. If you wanted to switch databases, you could just write a new adapter. User interfaces would also be ports which could be filled with various adapters without modifying the core logic.

## 4. Emergent Architecture

// TODO

## 5. See also

- Medium [Onion vs Clean vs Hexagonal Architecture](https://medium.com/@edamtoft/onion-vs-clean-vs-hexagonal-architecture-9ad94a27da91) article.
