# Software Design Principles

Software design principles are a set of guidelines that help developers create a high-quality system design.

- [SOLID](#solid)
- [DRY](#dry)
- [KISS](#kiss)
- [YAGNI](#yagni)

## SOLID

SOLID (SRP, OCP, LSP, ISP, DIP) is the important principle principle. It is combination of five basic designing principles.

1. Single Responsibility Principle (SRP)

    This principle states that there should never be more than one reason for a class to change. This means that you should design your classes in such a way that each class should have a single purpose.

    Example - An Account class is responsible for managing Current and Saving Account but a CurrentAccount and a SavingAccount classes would be responsible for managing current and saving accounts respectively. Hence both are responsible for single purpose only. Hence we are moving towards specialization.

2. Open/Closed Principle (OCP)

    This principle states that software entities (classes, modules, functions, etc.) should be open for extension but closed for modification. The "closed" part of the rule states that once a module has been developed and tested, the code should only be changed to correct bugs. The "open" part says that you should be able to extend existing code in order to introduce new functionality.

    Example – A PaymentGateway base class contains all basic payment related properties and methods. This class can be extended by different PaymentGateway classes for different payment gateway vendors to achieve theirs functionalities. Hence it is open for extension but closed for modification.

3. Liscov Substitution Principle (LSP)

    This principle states that functions that use pointers or references to base classes must be able to use objects of derived classes without knowing it.

    Example - Assume that you have an inheritance hierarchy with Person and Student. Wherever you can use Person, you should also be able to use a Student, because Student is a subclass of Person.

4. Interface Segregation Principle (ISP)

    This principle states that Clients should not be forced to depend upon interfaces that they don’t use. This means the number of members in the interface that is visible to the dependent class should be minimized.

    Example - The service interface that is exposed to the client should contains only client related methods not all.

5. Dependency Inversion Principle (DIP)

    The Dependency Inversion Principle states that:

    High level modules should not depend upon low level modules. Both should depend upon abstractions.

    Abstractions should not depend upon details. Details should depend upon abstractions.

    It helps us to develop loosely couple code by ensuring that high-level modules depend on abstractions rather than concrete implementations of lower-level modules. The Dependency Injection pattern is an implementation of this principle

    Example - The Dependency Injection pattern is an implementation of this principle

## DRY

DRY (Don't Repeat Yourself) - This principle states that each small pieces of knowledge (code) may only occur exactly once in the entire system. This helps us to write scalable, maintainable and reusable code.

Example – Asp.Net MVC framework works on this principle.

## KISS

KISS (Keep It Short and Simple) - This principle states that try to keep each small piece of software simple and unnecessary complexity should be avoided. This helps us to write easy maintainable code.

## YAGNI

YAGNI (You Ain't Gonna Need It) - This principle states that always implement things when you actually need them never implements things before you need them.
