# Comment

[Comment](https://en.m.wikipedia.org/wiki/Comment_(computer_programming)) is text within the source code that is not executed as part of the program but serves to provide human-readable explanations, documentation, or annotations. Comments are used to describe the purpose of code, explain complex algorithms, or make notes for future developers.

- [1. Category](#1-category)
  - [1.1. Styles](#11-styles)
  - [1.2. Tags](#12-tags)
- [2. Principles](#2-principles)
- [3. References](#3-references)

## 1. Category

### 1.1. Styles

Comment styles are the conventions and syntax used to write comments in programming languages. Since each language has its own rules, projects should define and follow a consistent style guide. Comments improve readability, reduce ambiguity, and make code reviews faster.

1. Types and Scopes

    - Inline Comments
      > Inline comments are written on the same line as code to clarify intent when the code alone is not obvious. They should be brief and focused on why the code exists, not what the syntax already shows.

      ```c
      #include <iostream>

      int add(int left, int right) {
        return left + right;
      }

      int main() {
        std::cout << add(1, 2) << std::endl;  // Keep output stable for demo snapshots.

        return 0;
      }
      ```

    - Single-Line Comments
      > Single-line comments document a nearby line or short block. They are useful for assumptions, constraints, or decisions that are not obvious from identifiers and control flow.

      ```c
      #include <iostream>

      int add(int left, int right) {
        return left + right;
      }

      int main() {
        // Keep argument values small to make manual verification easy.
        std::cout << add(1, 2) << std::endl;

        return 0;
      }
      ```

    - Multi-Line Comments
      > Multi-line comments document broader context such as algorithm trade-offs, data contracts, or migration notes. Prefer concise blocks and keep them close to the code they describe.

      ```c
      #include <iostream>

      int add(int left, int right) {
        return left + right;
      }

      int main() {
        /*
         * This sample intentionally calls add with fixed inputs.
         * Stable values simplify output checks in documentation builds.
         */
        std::cout << add(1, 2) << std::endl;

        return 0;
      }
      ```

    - Comment Tags
      > Comment tags mark actionable items such as incomplete work, defects, or temporary workarounds. Teams should standardize allowed tags and review them regularly.

      ```c
      #include <iostream>

      // TODO(<team>) Add overflow checks for untrusted integer input.
      int add(int left, int right) {
        return left + right;
      }

      int main() {
        std::cout << add(1, 2) << std::endl;

        return 0;
      }
      ```

    - Documentation Comments
      > Documentation comments are structured comments used by documentation tools (for example, Doxygen, Javadoc, and Sphinx). They describe public APIs and behavior contracts.

      ```c
      /// @file Demonstrates a documented addition function.

      #include <iostream>

      /// @brief Adds two integers.
      /// @param left First operand.
      /// @param right Second operand.
      /// @return Sum of the operands.
      int add(int left, int right) {
        return left + right;
      }

      int main() {
        std::cout << add(1, 2) << std::endl;

        return 0;
      }
      ```

### 1.2. Tags

[Comment Tags](https://peps.python.org/pep-0350/) are used to annotate and organize code with additional information to highlight specific aspects of the codebase.

Tags improve readability and maintainability by making technical debt and follow-up actions visible. Use tags intentionally and keep them traceable to real tasks or decisions.

1. Types and Scopes

    - `TODO`
      > Indicates planned work that is not finished yet.

      ```javascript
      // TODO Add error handling for invalid user input.
      function handleInput(input) {
          // logic here
      }
      ```

    - `FIXME`
      > Marks known defects that require correction.

      ```python
      # FIXME The program crashes when the input list is empty.
      def process_list(input_list):
          return max(input_list)
      ```

    - `XXX`
      > Flags code that is risky, ambiguous, or requires careful review.

      ```java
      // XXX Decide null-handling strategy to throw IllegalArgumentException or accept Optional<Integer>.
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

    - `HACK`
      > Indicates a temporary workaround with known limitations.

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
      > Marks known bug locations to triage and follow-up.

      ```javascript
      // BUG The application hangs when this function is called.
      function buggyFunction() {
          while(true) {}
      }
      ```

    - `OPTIMIZE`
      > Marks code paths that are correct but performance-sensitive.

      ```java
      // OPTIMIZE Use StringBuilder for string concatenation in loops to improve performance.
      for (int i = 0; i < array.length; i++) {
          array[i] = array[i] * 2;
      }
      ```

    - `NOTE`
      > Highlights important context that may be missed when reading quickly.

      ```python
      # NOTE The order of operations in the function is crucial for correct results.
      def complex_calculation(a, b, c):
          return (a + b) * c
      ```

    - `DEPRECATED`
      > Indicates APIs or features scheduled for removal.

      ```java
      // DEPRECATED The method will be removed in the next release. Use hashPasswordSHA2() instead.
      public void hashPasswordSHA1(String password) {
          // deprecated method logic
      }
      ```

    - `NIT`
      > Denotes minor style or readability suggestions.

      ```python
      # NIT Consider renaming this variable for better readability.
      x = "John"
      ```

## 2. Principles

- Clarity
  > Write comments that explain intent, assumptions, and trade-offs. If the code already states what is happening, prefer improving names or structure instead of repeating it in comments.
  
- Maintainability
  > Keep comments synchronized with implementation. Outdated comments are more harmful than missing comments because they mislead reviewers and maintainers.

- Collaboration
  > Use a shared vocabulary, consistent tag definitions, and predictable formatting so teams can scan and act quickly during reviews.

- Sparingly
  > Comment only when the added context is valuable. Prefer self-explanatory code and reserve comments for non-obvious decisions.

- Consistency
  > Apply one style guide for comment syntax, capitalization, punctuation, and tags across the repository.

- Update
  > Review and clean up comments during refactors and pull requests, including removing stale `TODO` and `HACK` entries.

## 3. References

- Python Enhancement Proposals [PEP 350 – Codetags](https://peps.python.org/pep-0350/) page.
- Wikipedia [comment](https://en.m.wikipedia.org/wiki/Comment_(computer_programming)) page.
