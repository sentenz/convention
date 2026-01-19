---
title: "Clean Code Guide"
date: 2025-01-13
draft: false
description: "Comprehensive guide to writing clean, maintainable code with SOLID principles and best practices"
tags: ["clean-code", "best-practices", "design-principles"]
---

# Clean Code Guide

- [Clean Code](#clean-code)
  - [Design Principles](#design-principles)
    - [DRY](#dry)
    - [KISS](#kiss)
    - [YAGNI](#yagni)
    - [SOLID](#solid)
    - [Four Rules of Simple Design](#four-rules-of-simple-design)
    - [Elegant Objects](#elegant-objects)
  - [Featured Articles](#featured-articles)
  - [Tutorials](#tutorials)
  - [Videos](#videos)
  - [Code Examples](#code-examples)
  - [Git Hub](#git-hub)
  - [Blogs](#blogs)
  - [Books](#books)
  - [Other](#other)
- [Summary](#summary)
  - [General rules](#general-rules)
  - [Design rules](#design-rules)
  - [Understandability tips](#understandability-tips)
  - [Names rules](#names-rules)
  - [Functions rules](#functions-rules)
  - [Comments rules](#comments-rules)
  - [Source code structure](#source-code-structure)
  - [Objects and data structures](#objects-and-data-structures)
  - [Tests](#tests)
  - [Code smells](#code-smells)

## Clean Code

Inspired by [Awesome Clean Code](https://github.com/kkisiele/awesome-clean-code).

### Design Principles

The code follows these principles

#### DRY

DRY (Don't Repeat Yourself)

#### KISS

KISS (Keep It Short and Simple)

#### YAGNI

YAGNI (You Ain't Gonna Need It)

#### SOLID

(SRP, OCP, LSP, ISP, DIP)

Acronym coined by Robert C. Martin (Uncle Bob) to describe the following five principles:

1. [The Single Responsibility Principle](https://docs.google.com/open?id=0ByOwmqah_nuGNHEtcU5OekdDMkk) A class should have only one reason to change.
2. [The Open Closed Principle](http://docs.google.com/a/cleancoder.com/viewer?a=v&pid=explorer&chrome=true&srcid=0BwhCYaYDn8EgN2M5MTkwM2EtNWFkZC00ZTI3LWFjZTUtNTFhZGZiYmUzODc1&hl=en) Software entities should be open for extension, but closed for modification.
3. [The Liskov Substitution Principle](https://drive.google.com/file/d/0BwhCYaYDn8EgNzAzZjA5ZmItNjU3NS00MzQ5LTkwYjMtMDJhNDU5ZTM0MTlh/view) Derived classes must be substitutable for their base classes.
4. [The Interface Segregation Principle](https://drive.google.com/file/d/0BwhCYaYDn8EgOTViYjJhYzMtMzYxMC00MzFjLWJjMzYtOGJiMDc5N2JkYmJi/view) Make fine grained interfaces that are client specific.
5. [The Dependency Inversion Principle](https://drive.google.com/file/d/0BwhCYaYDn8EgMjdlMWIzNGUtZTQ0NC00ZjQ5LTkwYzQtZjRhMDRlNTQ3ZGMz/view) Depend on abstractions, not on concretions.

A local copy of ["Design Principles and Design Patterns"](https://github.com/kkisiele/awesome-clean-code/raw/master/principles_and_patterns.pdf) by Robert C. Marin from _objectmentor.com_ website.
More about this principles with examples can be found [here](https://lostechies.com/wp-content/uploads/2011/03/pablos_solid_ebook.pdf)

#### Four Rules of Simple Design

Inspired by [Kent Beck's Four Rules of Simple Design](https://martinfowler.com/bliki/BeckDesignRules.html)
A design which:

1. Passes all tests.
2. Reveals intention.
3. No duplication.
4. Fewest elements.

#### Elegant Objects

Inspired by [Elegant Objects](http://www.elegantobjects.org)

1. No null.
2. No code in constructors.
3. No getters and setters.
4. No mutable objects.
5. No static methods, not even private ones.
6. No instanceof, type casting, or reflection.
7. No public methods without @Override.
8. No statements in test methods except assertThat.
9. No implementation inheritance.

### Featured Articles

- [When A Method Can Do Nothing](https://michaelfeathers.silvrback.com/when-it-s-okay-for-a-method-to-do-nothing)
- [Tell Don't Ask](https://martinfowler.com/bliki/TellDontAsk.html)
- [Converting Queries to Commands](https://michaelfeathers.silvrback.com/converting-queries-to-commands)
- [Object Calisthenics](https://www.bennadel.com/resources/uploads/2012/ObjectCalisthenics.pdf)
- [How Interfaces Are Refactoring Our Code](http://www.amihaiemil.com/2017/08/12/how-interfaces-are-refactoring-our-code.html)
- [Your Constructors are Completely Irrational](http://blog.thecodewhisperer.com/permalink/your-constructors-are-completely-irrational)
- [Class naming](http://objology.blogspot.com/2011/09/one-of-best-bits-of-programming-advice.html)
- [Names objects after things, not actions!](http://matteo.vaccari.name/blog/archives/743)
- [Interfacing with hard-to-test third-party code](http://misko.hevery.com/2009/01/04/interfacing-with-hard-to-test-third-party-code/)
- [How to Think About the "new" Operator with Respect to Unit Testing](http://misko.hevery.com/2008/07/08/how-to-think-about-the-new-operator/)
- [Avoiding Repetition](https://www.martinfowler.com/ieeeSoftware/repetition.pdf)
- [Design Principles from Design Patterns - A Conversation with Erich Gamma](https://www.artima.com/lejava/articles/designprinciplesP.html)
- [Programming Like Kent Beck](https://blog.iterate.no/2012/06/20/programming-like-kent-beck/)
- [How Immutability Helps](https://www.yegor256.com/2014/11/07/how-immutability-helps.html)
- [Clean Architecture](https://8thlight.com/blog/uncle-bob/2012/08/13/the-clean-architecture.html)
- [Hexagonal Architecture: three principles and an implementation example](https://blog.octo.com/en/hexagonal-architecture-three-principles-and-an-implementation-example/)
- [Getting Started With DDD When Surrounded By Legacy Systems](http://domainlanguage.com/wp-content/uploads/2016/04/GettingStartedWithDDDWhenSurroundedByLegacySystemsV1.pdf)

### Tutorials

- [Refactoring a JavaScript video store](https://martinfowler.com/articles/refactoring-video-store-js)

- [Bowling Game Kata](http://butunclebob.com/ArticleS.UncleBob.TheBowlingGameKata)
- [Refactoring from anemic model to DDD](https://blog.pragmatists.com/refactoring-from-anemic-model-to-ddd-880d3dd3d45f)
- [Writing Testable Code](http://misko.hevery.com/code-reviewers-guide)
- [Essential Skills for Agile Development](http://www2.cpttm.org.mo/cyberlab/softdev/ESAD/)
- [First Pop Coffee Company](https://buildplease.com/pages/fpc-1/)
- [Testing legacy by Sandro Mancuso](https://codurance.com/2011/07/16/testing-legacy-hard-wired-dependencies/), [part 2](https://codurance.com/2011/07/18/testing-legacy-hard-wired-dependencies_17/), and [video](https://www.youtube.com/watch?v=_NnElPO5BU0)
- [Live Refactoring Towards Solid Code](https://www.youtube.com/watch?v=jwJnd9ycs6Q)
- [Introducing the Gilded Rose kata and writing test cases using Approval Tests by Emily Bache](https://www.youtube.com/watch?v=zyM2Ep28ED8), [part 2](https://www.youtube.com/watch?v=OJmg9aMxPDI) and [part 3](https://www.youtube.com/watch?v=NADVhSjeyJA)
- [Domain Driven Design Crash Course](https://vaadin.com/learn/tutorials/ddd)
- [Reactive in practice: A complete guide to event-driven systems development in Java](https://developer.ibm.com/series/reactive-in-practice/)
- [Writing Clean Tests](https://www.petrikainulainen.net/writing-clean-tests/)

### Videos

- [How To Design A Good API and Why it Matters by Joshua Bloch](https://www.youtube.com/watch?v=aAb7hSCtvGw)

- [Inheritance, Polymorphism, & Testing](https://www.youtube.com/watch?v=4F72VULWFvc)
- [Don't Look For Things!](https://www.youtube.com/watch?v=RlfLCWKxHJ0)
- [Don't Create Objects That End With -ER](https://www.youtube.com/watch?v=WpP4rIhh5e4)
- [8 Lines of Code by Greg Young](https://www.infoq.com/presentations/8-lines-code-refactoring) Accompanied [slides](https://github.com/kkisiele/awesome-clean-code/raw/master/GregYoung_8LinesOfCode.pdf)
- [19 1/2 Things to Make You a Better Object Oriented Programmer](https://vimeo.com/17151526) Nice [summary](http://www.simpletechture.nl/blog/2011/objectoriented/)
- [Railway oriented programming: Error handling in functional languages](https://vimeo.com/113707214)
- [Yves Reynhout - Trench Talk: Evolving a Model](https://www.youtube.com/watch?v=7StN-vNjRSw)
- [Seven Ineffective Coding Habits of Many Programmers by Kevlin Henney](https://www.youtube.com/watch?v=ZsHMHukIlJY)
- [Java Optional - The Mother of All Bikesheds by Stuart Marks](https://www.youtube.com/watch?v=Ej0sss6cq14)

### Code Examples

- [Code Katas](https://github.com/kkisiele/codekata)

- [hentai](https://github.com/jakubnabrdalik/hentai)
- [Source code for the book, "Growing Object-Oriented Software, Guided by Tests"](https://github.com/sf105/goos-code)
- [jcabi-email](https://github.com/jcabi/jcabi-email)
- [Assignment done for some interview](https://github.com/kkisiele/loganalyzer)

### Git Hub

- [Nat Pryce](https://github.com/npryce)

- [Steve Freeman](https://github.com/sf105)
- [Matteo Vaccari](https://github.com/xpmatteo)

### Blogs

- [Martin Fowler](https://martinfowler.com/bliki)

- [Michael Feathers](https://michaelfeathers.silvrback.com)
- [Robert C. Martin (Uncle Bob)](https://blog.cleancoder.com)
- [Yegor Bugayenko](http://www.yegor256.com)
- [Code Cop](http://blog.code-cop.org)
- [The Code Whisperer](http://blog.thecodewhisperer.com)
- [jbrains.ca](http://blog.jbrains.ca)
- [Nat Pryce](http://www.natpryce.com)
- [Steve Freeman](http://www.m3p.co.uk/blog)
- [Miško Hevery](http://misko.hevery.com)
- [Matteo Vaccari](http://matteo.vaccari.name/blog)
- [Carlo Pescio](http://www.carlopescio.com)
- [Jeffrey Palermo](http://jeffreypalermo.com)
- [Kenneth Truyers](https://www.kenneth-truyers.net)
- [Vaughn Vernon](http://forcomprehension.com/blog/)
- [Codurance](https://codurance.com/publications/)
- [Mihai](https://www.amihaiemil.com)
- [Enterprise Craftsmanship](https://enterprisecraftsmanship.com)
- [The Iterate Blog](https://blog.iterate.no)
- [The Holy Java](https://theholyjava.wordpress.com)

### Books

- [Refactoring: Improving the Design of Existing Code by Martin Fowler](https://www.amazon.com/Refactoring-Improving-Existing-Addison-Wesley-Technology-ebook/dp/B007WTFWJ6) errata for the book can be found [here](https://martinfowler.com/refactoringErrata.html)

- [Clean Code by Robert C. Martin](https://www.amazon.com/Clean-Code-Handbook-Software-Craftsmanship-ebook/dp/B001GSTOAM)
- [Design Patterns: Elements of Reusable Object-Oriented Software](https://www.amazon.com/Design-Patterns-Object-Oriented-Addison-Wesley-Professional-ebook/dp/B000SEIBB8)
- [Elegant Objects by Yegor Bugayenko](https://www.amazon.com/gp/product/1519166915/)
- [Growing Object-Oriented Software, Guided by Tests](https://www.amazon.com/Growing-Object-Oriented-Software-Guided-Tests-dp-0321503627/dp/0321503627/)

### Other

- [Code Katas](http://codekata.com)

## Summary

Inspired by [Summary of 'Clean code'](https://gist.github.com/wojteklu/73c6914cc446146b8b533c0988cf8d29).

Code is clean if it can be understood easily – by everyone on the team. Clean code can be read and enhanced by a developer other than its original author. With understandability comes readability, changeability, extensibility and maintainability.

### General rules

1. Follow standard conventions.
2. Keep it simple stupid. Simpler is always better. Reduce complexity as much as possible.
3. Boy scout rule. Leave the campground cleaner than you found it.
4. Always find root cause. Always look for the root cause of a problem.

### Design rules

1. Keep configurable data at high levels.
2. Prefer polymorphism to if/else or switch/case.
3. Separate multi-threading code.
4. Prevent over-configurability.
5. Use dependency injection.
6. Follow Law of Demeter. A class should know only its direct dependencies.

### Understandability tips

1. Be consistent. If you do something a certain way, do all similar things in the same way.
2. Use explanatory variables.
3. Encapsulate boundary conditions. Boundary conditions are hard to keep track of. Put the processing for them in one place.
4. Prefer dedicated value objects to primitive type.
5. Avoid logical dependency. Don't write methods which works correctly depending on something else in the same class.
6. Avoid negative conditionals.

### Names rules

1. Choose descriptive and unambiguous names.
2. Make meaningful distinction.
3. Use pronounceable names.
4. Use searchable names.
5. Replace magic numbers with named constants.
6. Avoid encodings. Don't append prefixes or type information.

### Functions rules

1. Small.
2. Do one thing.
3. Use descriptive names.
4. Prefer fewer arguments.
5. Have no side effects.
6. Don't use flag arguments. Split method into several independent methods that can be called from the client without the flag.

### Comments rules

1. Always try to explain yourself in code.
2. Don't be redundant.
3. Don't add obvious noise.
4. Don't use closing brace comments.
5. Don't comment out code. Just remove.
6. Use as explanation of intent.
7. Use as clarification of code.
8. Use as warning of consequences.

### Source code structure

1. Separate concepts vertically.
2. Related code should appear vertically dense.
3. Declare variables close to their usage.
4. Dependent functions should be close.
5. Similar functions should be close.
6. Place functions in the downward direction.
7. Keep lines short.
8. Don't use horizontal alignment.
9. Use white space to associate related things and disassociate weakly related.
10. Don't break indentation.

### Objects and data structures

1. Hide internal structure.
2. Prefer data structures.
3. Avoid hybrids structures (half object and half data).
4. Should be small.
5. Do one thing.
6. Small number of instance variables.
7. Base class should know nothing about their derivatives.
8. Better to have many functions than to pass some code into a function to select a behavior.
9. Prefer non-static methods to static methods.

### Tests

1. One assert per test.
2. Readable.
3. Fast.
4. Independent.
5. Repeatable.

### Code smells

1. Rigidity. The software is difficult to change. A small change causes a cascade of subsequent changes.
2. Fragility. The software breaks in many places due to a single change.
3. Immobility. You cannot reuse parts of the code in other projects because of involved risks and high effort.
4. Needless Complexity.
5. Needless Repetition.
6. Opacity. The code is hard to understand.
