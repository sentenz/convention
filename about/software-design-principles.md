# Software Design Principles

Software design principles are a set of guidelines that help developers create a high-quality system design.

- [SOLID](#solid)
- [IDEALS](#ideals)
- [GRASP](#grasp)
- [DRY](#dry)
- [KISS](#kiss)
- [YAGNI](#yagni)
- [POLP](#polp)

## SOLID

[SOLID](https://en.wikipedia.org/wiki/SOLID) is a acronym for five design principles intended to design Object-Oriented Programming (OOP) understandable, flexible, and maintainable.

1. Single Responsibility Principle

    The [single-responsibility principle (SRP)](https://en.wikipedia.org/wiki/Single-responsibility_principle) is a computer-programming principle that states that every module, class or function in a computer program should have responsibility over a single part of that program's functionality, and it should encapsulate that part. All of that module, class or function's services should be narrowly aligned with that responsibility.

2. Open/Closed Principle

    The [open–closed principle (OCP)](https://en.wikipedia.org/wiki/Open-closed_principle) states software entities (classes, modules, functions, etc.) should be open for extension, but closed for modification. That is, such an entity can allow its behaviour to be extended without modifying its source code. The name open–closed principle has been used in two ways. Both ways use generalizations (for instance, inheritance or delegate functions) to resolve the apparent dilemma, but the goals, techniques, and results are different

3. Liscov Substitution Principle

   The [Liskov substitution principle (LSP)](https://en.wikipedia.org/wiki/Liskov_substitution_principle) is a particular definition of a subtyping relation, called strong behavioral subtyping. It is based on the concept of `substitutability`. A principle in object-oriented programming stating that an object (such as a class) and a sub-object (such as a class that extends the first class) must be interchangeable without breaking the program. It is a semantic rather than merely syntactic relation, because it intends to guarantee semantic interoperability of types in a hierarchy, object types in particular.

4. Interface Segregation Principle

   The [interface segregation principle (ISP)](https://en.wikipedia.org/wiki/Interface_segregation_principle) states that no code should be forced to depend on methods it does not use. ISP splits interfaces that are very large into smaller and more specific ones so that clients will only have to know about the methods that are of interest to them. Such shrunken interfaces are also called role interfaces. ISP is intended to keep a system decoupled and thus easier to refactor, change, and redeploy.

5. Dependency Inversion Principle

   The [dependency inversion principle (DIP)](https://en.wikipedia.org/wiki/Dependency_inversion_principle) is a specific methodology for loosely coupling software modules. The DIP states that high-level modules should not depend on low-level modules; both should depend on abstractions. Abstractions should not depend on details. Details should depend upon abstractions.
   > The [Dependency Injection](../about/software-design-pattern.md#dependency-injection) pattern is an implementation of the DIP principle.

## IDEALS

// TODO

## GRASP

// TODO

## DRY

The Don't Repeat Yourself (states) principle states that each small pieces of knowledge (code) may only occur exactly once in the entire system. This helps us to write scalable, maintainable and reusable code.

## KISS

The Keep It Short and Simple (KISS) principle states that try to keep each small piece of software simple and unnecessary complexity should be avoided. This helps us to write easy maintainable code.

## YAGNI

The You Ain't Gonna Need It (YAGNI) principle states that always implement things when you actually need them never implements things before you need them.

## POLP

The Principle Of Least Privilege (POLP) principle states that a concept of computer security that limits access rights to what is absolutely necessary to perform tasks. Users or processes are given permission only to read, write, or execute files or resources that are necessary to perform tasks.
