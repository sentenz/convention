# Comment

[Comment](https://en.m.wikipedia.org/wiki/Comment_(computer_programming)) is text within the source code that is not executed as part of the program but serves to provide human-readable explanations, documentation, or annotations. Comments are used to describe the purpose of code, explain complex algorithms, or make notes for future developers.

- [1. Category](#1-category)
  - [1.1. Styles](#11-styles)
  - [1.2. Tags](#12-tags)
- [2. Principles](#2-principles)
- [3. References](#3-references)

## 1. Category

### 1.1. Styles

Comment Styles refer to the conventions and syntax used to write comments in programming languages. Different programming languages may have distinct comment styles. Styles help developers create clear, consistent, and informative comments, contributing to code readability and maintainability. Adopting a consistent comment style within a project or organization helps streamline collaboration and code reviews.

1. Types and Scopes

    - Inline Comments
      > Inline comments are inserted directly into the code and are used to provide explanations or clarifications about specific lines or sections of code. They are often used to describe complex algorithms or to provide context for particular sections of code. Inline comments are useful for providing additional context and can help make code more readable and understandable for other developers.

      ```c
      #include <iostream>

      int myFunction(int arg1, int arg2) {
        return arg1 + arg2;
      }

      int main(int argc, char *argv[]) {
        std::cout << "Hello, world!" << std::endl;  // This is an inline comment

        std::cout << "This is a single-line comment" << std::endl;

        int var = myFunction();

        return 0;
      }
      ```

    - Single-Line Comments
      > Single-line comments are a concise way to provide brief explanations or clarifications about particular lines of code. They are commonly used to explain the purpose of a particular variable or function call, or to provide additional context about how a specific piece of code works. Single-line comments are often preceded by a special character or symbol, such as `//` or `#`, and are useful for providing quick, concise documentation.

      ```c
      #include <iostream>

      int myFunction(int arg1, int arg2) {
        return arg1 + arg2;
      }

      int main(int argc, char *argv[]) {
        std::cout << "Hello, world!" << std::endl;

        // Single-line comment
        std::cout << "This is a single-line comment" << std::endl;

        int var = myFunction();

        return 0;
      }
      ```

    - Multi-Line Comments
      > Multi-line comments are a more extensive form of documentation that can be used to describe large sections of code or to provide detailed explanations about particular algorithms or data structures. They are often enclosed in a special block of characters or symbols, such as `/* ... */`, `''' ... '''`, or preceded by a triple forward slash `///` and can be used to provide comprehensive documentation for complex sections of code.

      ```c
      #include <iostream>

      int myFunction(int arg1, int arg2) {
        return arg1 + arg2;
      }

      int main(int argc, char *argv[]) {
        std::cout << "Hello, world!" << std::endl;

        std::cout << "This is a single-line comment" << std::endl;

        //  Multi-line comment
        //  This is a multi-line comment.
        //  It can span multiple lines.

        int var = myFunction();

        return 0;
        }
      ```

    - Comment Tags
      > Comment tags are used to indicate that a particular section of code requires attention or modification. They often include tags like `TODO`, `FIXME`, or `HACK`, and are used to help developers quickly identify sections of code that need to be addressed. Comment tags are useful for ensuring that code is continuously updated and maintained, and can help prevent issues from arising in the future.

      ```c
      #include <iostream>

      // TODO(<User>) This is a comment tag to add error handling
      int myFunction(int arg1, int arg2) {
        return arg1 + arg2;
      }

      int main(int argc, char *argv[]) {
        std::cout << "Hello, world!" << std::endl;

        std::cout << "This is a single-line comment" << std::endl;

        int var = myFunction();

        return 0;
      }
      ```

    - Documentation Comments
      > Documentation comments are a special type of comment that is used to generate documentation for the code. They are often used to describe functions, classes, or other components of the code, and can be automatically extracted to create documentation that can be shared with other developers. Documentation comments are a critical tool for ensuring that code is well-documented and easy to understand, and can help developers quickly understand the purpose and functionality of different parts of the code.

      ```c
      /// @file This file contains the main function for the program.

      #include <iostream>

      /// @brief A brief description of the function.
      /// @details This is a detailed description of the function. It can span multiple lines and can
      /// include examples, parameter descriptions, and return value descriptions.
      /// @param arg1 A description of the first argument.
      /// @param arg2 A description of the second argument.
      /// @return A description of the return value.
      int myFunction(int arg1, int arg2) {
        return arg1 + arg2;
      }

      int main(int argc, char *argv[]) {
        std::cout << "Hello, world!" << std::endl;

        std::cout << "This is a single-line comment" << std::endl;

        int var = myFunction();

        return 0;
      }
      ```

### 1.2. Tags

[Comment Tags](https://peps.python.org/pep-0350/) are used to annotate and organize code with additional information to highlight specific aspects of the codebase.

Tags consistently improve the readability, maintainability, and overall quality of the codebase. They provide valuable information for future developers and assist in tracking ongoing development tasks.

1. Types and Scopes

    - `TODO`
      > Indicates that a section of code needs to be completed in the future.

      ```javascript
      // TODO Add error handling for invalid user input.
      function handleInput(input) {
          // logic here
      }
      ```

    - `FIXME`
      > Marks parts of the code that are broken and need fixing.

      ```python
      # FIXME The program crashes when the input list is empty.
      def process_list(input_list):
          return max(input_list)
      ```

    - `XXX`
      > Flags areas of code that are problematic or could potentially cause issues. Use `XXX` to indicate code that needs close attention, additional review, or a planned refactor.

      Before:

      ```java
      // XXX Missing proper null values handling, whether to throwing IllegalArgumentException or use `Optional<Integer>`.
      public int calculateSum(Integer a, Integer b) {
        if (a == null) {
          a = 0;
        }
        if (b == null) {
          b = 0;
        }
        return a + b;
      }
      ```

      After:

      ```java
      public int calculateSum(Integer a, Integer b) {
        if (a == null || b == null) {
          throw new IllegalArgumentException("calculateSum: arguments must not be null");
        }
        return a + b;
      }
      ```

    - `HACK`
      > Indicates a workaround or a quick and dirty solution that might not be optimal or proper.

      ```csharp
      // HACK Using a global variable to share data across methods.
      public int GlobalVariable;

      public void Method1() {
          GlobalVariable = 10;
      }

      public void Method2() {
          int localVariable = GlobalVariable;
      }
      ```

    - `BUG`
      > Marks known bug points in the code.

      ```javascript
      // BUG The application hangs when this function is called.
      function buggyFunction() {
          while(true) {}
      }
      ```

    - `OPTIMIZE`
      > Marks areas of the code that are considered inefficient or could be optimized for better performance.

      ```java
      // OPTIMIZE Use StringBuilder for string concatenation in loops to improve performance.
      for (int i = 0; i < array.length; i++) {
          array[i] = array[i] * 2;
      }
      ```

    - `NOTE`
      > Highlights important aspects of the code or provides additional information about the code.

      ```python
      # NOTE The order of operations in the function is crucial for correct results.
      def complex_calculation(a, b, c):
          return (a + b) * c
      ```

    - `DEPRECATED`
      > Indicates that a particular software feature is in the process of being phased out.

      ```java
      // DEPRECATED The method will be removed in the next release. Use hashPasswordSHA2() instead.
      public void hashPasswordSHA1(String password) {
          // deprecated method logic
      }
      ```

    - `NIT`
      > Denotes minor changes or suggestions that don't necessarily affect the function of the code.

      ```python
      # NIT Consider renaming this variable for better readability.
      x = "John"
      ```

## 2. Principles

- Clarity
  > Clear documentation comments help developers understand the code's intended functionality, how it works, and how to use it correctly, which is particularly important in complex projects or when dealing with legacy code.
  
- Maintainability
  > Documentation contributes to the code's maintainability, making it easier for developers to update, modify, or fix the code even if they were not the original authors. This ensures that the code remains relevant and can be extended or improved over time without introducing errors.

- Collaboration
  > Documentation promotes collaboration by allowing team members to understand each other's code, share knowledge, and work together more effectively. It serves as a reference for team members, facilitating communication and coordination in software development projects.

- Sparingly
  > Comments should only be used where necessary to provide additional context or documentation. Overuse of comments can make the code more difficult to read and understand, as irrelevant or unnecessary information can distract from the code.

- Consistency
  > Consistent formatting of comments makes the code more readable and easier to understand. Use the same comment characters or symbols and indentation for all comments.

- Update
  > Comments should be updated as the code evolves to ensure that they remain accurate and up-to-date. Periodically review comments to ensure that they continue to provide accurate and useful information about the code.

## 3. References

- Python Enhancement Proposals [PEP 350 – Codetags](https://peps.python.org/pep-0350/) page.
- Wikipedia [comment](https://en.m.wikipedia.org/wiki/Comment_(computer_programming)) page.
