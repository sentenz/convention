---
title: "Software Architecture"
date: 2026-01-13
draft: false
description: "Fundamental structures of software systems including Clean, Onion, Hexagonal, and Layered architectures"
tags: ["architecture", "design", "patterns"]
---

# Software Architecture

Software architecture refers to the fundamental structures of a software system and the discipline of creating such structures and systems. Each structure comprises software elements, relations among them, and properties of both elements and relations.

- [1. Clean Architecture](#1-clean-architecture)
- [2. Onion Architecture](#2-onion-architecture)
- [3. Hexagonal Architecture](#3-hexagonal-architecture)
- [4. Layered / N-tier Architecture](#4-layered--n-tier-architecture)
- [5. References](#5-references)

## 1. Clean Architecture

[Clean Architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html) was introduced by Robert Martin (aka Uncle Bob) in 2012. Clean architecture attempts to provide a cost-effective method for developing quality code that is changeable and has fewer dependencies.

Clean architecture is a software design philosophy that separates the elements of a design into ring levels. An important goal of clean architecture is to provide developers with a way to organize code in such a way that it encapsulates the business logic but keeps it separate from the delivery mechanism.

The main rule of clean architecture is that code dependencies can only move from the outer levels inward. Code on the inner layers can have no knowledge of functions on the outer layers. The variables, functions and classes (any entities) that exist in the outer layers can not be mentioned in the more inward levels. It is recommended that data formats also stay separate between levels.

## 2. Onion Architecture

[Onion Architecture](https://jeffreypalermo.com/2008/07/the-onion-architecture-part-1/) was introduced by Jeffrey Palermo in 2008. It expanded on the idea to define a “Core” within the application and various layers surrounding it. The core “Domain Model” represents enterprise-wide business rules. In the next layer up are “Domain Services” such as abstract repositories (still leaving the implementation details such as a database connection to the outer layers). Further up is “Application Services” which defined the business processes of the application. In the outer-most layer are the user interface, connections to external infrastructure, and automated tests. Like ports-and-adapters, this pattern leaves the connections to all external dependencies such as databases, APIs, and user interfaces at the edge so they can be switched out.

## 3. Hexagonal Architecture

[Hexagonal Architecture](https://alistair.cockburn.us/hexagonal-architecture/) was introduced by Alistair Cockburn in 2005. The most bare bones application of the principal is Hexagonal or Ports and Adapters architecture. Confusingly, the pattern really has nothing to do with hexagons, it’s how it’s usually drawn. The fact that it has 6 sides is arbitrary.

The concept behind Hexagonal Architecture is that the core application logic is written with only a concept of external dependencies it has. In object-oriented terms this means it declares and references and interface, but leaves the implementation of that interface out of the core logic. This can be thought of as a `port` such a display port or USB port. The outer layer of the application then creates an `adapter` which plugs into the port, so if there was a database port, the adapter would plug into that port and provide a connection to a particular database. If want to change the database, write a new adapter. User interfaces would also be ports which could be filled with various adapters without modifying the core logic.

## 4. Layered / N-tier Architecture

An [n-tier](https://learn.microsoft.com/en-us/azure/architecture/guide/architecture-styles/n-tier) architecture divides an application into logical layers and physical tiers.

Layers are a way to separate responsibilities and manage dependencies. Each layer has a specific responsibility. A higher layer can use services in a lower layer, but not the other way around.

- Presentation layer (aka UI layer)
- Application layer (aka service layer)
- Business logic layer (aka domain layer)
- Data access layer (aka persistence layer)

Tiers are physically separated, running on separate machines. A tier can call to another tier directly, or use asynchronous messaging (message queue). Although each layer might be hosted in its own tier, that's not required. Several layers might be hosted on the same tier. Physically separating the tiers improves scalability and resiliency, but also adds latency from the additional network communication.

A traditional three-tier application has a presentation tier, a middle tier, and a database tier. The middle tier is optional. More complex applications can have more than three tiers. The diagram above shows an application with two middle tiers, encapsulating different areas of functionality.

An N-tier application can have a closed layer architecture or an open layer architecture:

- In a closed layer architecture, a layer can only call the next layer immediately down.
- In an open layer architecture, a layer can call any of the layers below it.

A closed layer architecture limits the dependencies between layers. However, it might create unnecessary network traffic, if one layer passes requests along to the next layer.

N-tier architectures are typically implemented as infrastructure-as-service (IaaS) applications, with each tier running on a separate set of VMs. However, an N-tier application doesn't need to be pure IaaS. Often, it's advantageous to use managed services for some parts of the architecture, particularly caching, messaging, and data storage.

Consider an N-tier architecture for:

- Basic web applications.
- Migrating an on-premises application to Azure with minimal refactoring.
- Unified development of on-premises and cloud applications.

N-tier architectures are common in traditional on-premises applications.


## 5. References

- Medium [Onion vs Clean vs Hexagonal Architecture](https://medium.com/@edamtoft/onion-vs-clean-vs-hexagonal-architecture-9ad94a27da91) article.
