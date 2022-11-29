# Architectural Pattern

An architectural pattern is a general, reusable solution to a commonly occurring problem in software architecture within a given context.

- [1. MVVM](#1-mvvm)
- [2. MVP](#2-mvp)
- [3. MVC](#3-mvc)
- [4. References](#4-references)

## 1. MVVM

Model View ViewModel (MVVM) is a software architectural pattern that facilitates the separation of the development of the graphical user interface (the view) – be it via a markup language or GUI code – from the development of the business logic or back-end logic (the model) so that the view is not dependent on any specific model platform. The viewmodel of MVVM is a value converter, meaning the viewmodel is responsible for exposing (converting) the data objects from the model in such a way that objects are easily managed and presented. In this respect, the viewmodel is more model than view, and handles most if not all of the view's display logic. The viewmodel may implement a mediator pattern, organizing access to the back-end logic around the set of use cases supported by the view.

MVVM is a variation of Martin Fowler's Presentation Model design pattern. It was invented by Microsoft architects Ken Cooper and Ted Peters specifically to simplify event-driven programming of user interfaces. The pattern was incorporated into Windows Presentation Foundation (WPF) (Microsoft's .NET graphics system) and Silverlight (WPF's Internet application derivative). John Gossman, one of Microsoft's WPF and Silverlight architects, announced MVVM on his blog in 2005.

Model–view–viewmodel is also referred to as model–view–binder, especially in implementations not involving the .NET platform. ZK (a web application framework written in Java) and KnockoutJS (a JavaScript library) use model–view–binder.

Components of MVVM pattern:

- Model
  > Model refers either to a domain model, which represents real state content (an object-oriented approach), or to the data access layer, which represents content (a data-centric approach).

- View
  > As in the model–view–controller (MVC) and model–view–presenter (MVP) patterns, the view is the structure, layout, and appearance of what a user sees on the screen. It displays a representation of the model and receives the user's interaction with the view (mouse clicks, keyboard input, screen tap gestures, etc.), and it forwards the handling of these to the view model via the data binding (properties, event callbacks, etc.) that is defined to link the view and view model.

- View model
  > The view model is an abstraction of the view exposing public properties and commands. Instead of the controller of the MVC pattern, or the presenter of the MVP pattern, MVVM has a binder, which automates communication between the view and its bound properties in the view model. The view model has been described as a state of the data in the model. The main difference between the view model and the Presenter in the MVP pattern is that the presenter has a reference to a view, whereas the view model does not. Instead, a view directly binds to properties on the view model to send and receive updates. To function efficiently, this requires a binding technology or generating boilerplate code to do the binding.

- Binder
  > Declarative data and command-binding are implicit in the MVVM pattern. In the Microsoft solution stack, the binder is a markup language called XAML. The binder frees the developer from being obliged to write boiler-plate logic to synchronize the view model and view. When implemented outside of the Microsoft stack, the presence of a declarative data binding technology is what makes this pattern possible, and without a binder, one would typically use MVP or MVC instead and have to write more boilerplate (or generate it with some other tool).

## 2. MVP

Model View Presenter (MVP) is a software architectural pattern that emerged from the Model View Controller (MVC). It describes a new approach to completely separate the model and the view and to connect them via a presenter. Besides a clearly improved testability also the stricter separation of the individual components in contrast to MVC stands in the foreground.

For the first time this design pattern was used and called in the 1990er years of IBM and Taligent. Martin Fowler formulated however in the year 2004 model-view-presenter after its understanding. His definition is decisive today.

Components of MVP pattern:

- Model
  > The model represents the logic of the view. This can also be the business logic. However, all functionality must be accessible via the model in order to operate the view. The presenter alone controls the model. The model itself knows neither the view nor the presenter.

- View
  > The view does not contain any controlling logic and is solely responsible for the presentation and the inputs and outputs. It does not get access to the functionality of the presenter nor to the model. All control of the view is done by the presenter.

- Presenter
  > The presenter is the link between model and view. It controls the logical flows between the other two layers and ensures that the view can fulfill its functionality. For the presenter, interfaces are used for model and view respectively. The interfaces define the exact structure of the two layers and the presenter merely links the interfaces with each other. This ensures the complete interchangeability and reusability of Model and View.

## 3. MVC

Model View Controller (MVC) is a software architectural pattern commonly used for developing user interfaces that divide the related program logic into three interconnected elements. This is done to separate internal representations of information from the ways information is presented to and accepted from the user.

Traditionally used for desktop graphical user interfaces (GUIs), this pattern became popular for designing web applications. Popular programming languages have MVC frameworks that facilitate implementation of the pattern.

Components of MVC pattern:

- Model
  > The central component of the pattern. It is the application's dynamic data structure, independent of the user interface. The model is responsible for managing the data, logic and rules of the application. It receives user input from the controller.

- View
  > Any representation of information such as a chart, diagram or table. Multiple views of the same information are possible, such as a bar chart for management and a tabular view for accountants. The view renders presentation of the model in a particular format.

- Controller
  > The controller responds to the user input and performs interactions on the data model objects. The controller receives the input, optionally validates it and then passes the input to the model or view.

## 4. References

- Wikipedia [MVVM](https://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93viewmodel) article.
- Wikipedia [MVP](https://de.wikipedia.org/wiki/Model_View_Presenter) article.
- Wikipedia [MVC](https://en.wikipedia.org/wiki/Model-view-controller) article.
