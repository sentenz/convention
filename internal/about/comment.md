# Comment

Comments in computer programming, is a section of code that is not executed by the program, but is instead used to provide additional information or context about the code. Comments are typically used to explain what the code does, how it works, or why certain decisions were made in the development process.

- [1. Category](#1-category)
  - [1.1. Styles](#11-styles)
  - [1.2. Tags](#12-tags)
- [2. Principle](#2-principle)
- [3. Best Practice](#3-best-practice)
  - [3.1. Styles](#31-styles)
  - [3.2. Tags](#32-tags)
- [4. Terminology](#4-terminology)
- [5. References](#5-references)

## 1. Category

### 1.1. Styles

Comments are effective for providing code context and documentation and for improving code quality and maintainability. Different comment styles are used to provide different types of information about code, and it is important to use comments effectively to ensure that code is well-documented and easy to understand. By using different comment styles in appropriate ways, developers can help ensure that code is high-quality and can be easily maintained and updated over time.

Types of Comment Styles:

- Inline Comments
  > Inline comments are inserted directly into the code and are used to provide explanations or clarifications about specific lines or sections of code. They are often used to describe complex algorithms or to provide context for particular sections of code. Inline comments are useful for providing additional context and can help make code more readable and understandable for other developers.

- Single-Line Comments
  > Single-line comments are a concise way to provide brief explanations or clarifications about particular lines of code. They are commonly used to explain the purpose of a particular variable or function call, or to provide additional context about how a specific piece of code works. Single-line comments are often preceded by a special character or symbol, such as `//` or `#`, and are useful for providing quick, concise documentation.

- Multi-Line Comments
  > Multi-line comments are a more extensive form of documentation that can be used to describe large sections of code or to provide detailed explanations about particular algorithms or data structures. They are often enclosed in a special block of characters or symbols, such as `/* ... */`, `''' ... '''`, or preceded by a triple forward slash `///` and can be used to provide comprehensive documentation for complex sections of code.

- Comment Tags
  > Comment tags are used to indicate that a particular section of code requires attention or modification. They often include tags like `TODO`, `FIXME`, or `HACK`, and are used to help developers quickly identify sections of code that need to be addressed. Comment tags are useful for ensuring that code is continuously updated and maintained, and can help prevent issues from arising in the future.

- Documentation Comments
  > Documentation comments are a special type of comment that is used to generate documentation for the code. They are often used to describe functions, classes, or other components of the code, and can be automatically extracted to create documentation that can be shared with other developers. Documentation comments are a critical tool for ensuring that code is well-documented and easy to understand, and can help developers quickly understand the purpose and functionality of different parts of the code.

Example:

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
  // TODO(Sentenz) This is a comment tag to add error handling
  return arg1 + arg2;
}

int main(int argc, char *argv[]) {
  std::cout << "Hello, world!" << std::endl;  // This is an inline comment

  // Single-line comment
  std::cout << "This is a single-line comment" << std::endl;

  //  Multi-line comment
  //  This is a multi-line comment.
  //  It can span multiple lines.

  int var = myFunction();

  return 0;
}
```

### 1.2. Tags

Comment tags in programming are used to annotate code with additional information or notes that can help developers better understand, maintain, and improve the code. These tags usually take the form of a specific syntax, such as a double slash `//` in most programming languages, and are followed by a specific keyword or label that indicates the type of comment.

Comment tags are helpful in managing large codebases or collaborative projects, as they track specific issues, tasks, or requirements.

Types of Comment Tags:

- `TODO`
  > Indicates code that needs to be completed or implemented. The tag usually includes a description of what needs to be done to complete the task.

- `FIX`
  > Indicates code that needs to be fixed. The tag usually includes a description of what is wrong with the code.

- `HACK`
  > Indicates code that is a quick and dirty solution to a problem. The tag usually includes a description of why the code is a hack and what needs to be done to create a more permanent solution.

- `OPTIMIZE`
  > Indicates code that needs to be optimized for performance or memory usage. The tag usually includes a description of how the code can be optimized.

- `REFACTOR`
  > Indicates code code that needs to be refactored to improve its structure or organization. The tag usually includes a description of how the code can be refactored.

- `REVIEW`
  > Indicates code that needs to be reviewed by other programmers. The tag usually includes a description of what needs to be reviewed.

- `DEBUG`
  > Indicates code that needs to be debugged. The tag usually includes a description of the problem and any steps that have been taken to debug the code.

- `DOC`
  > Indicates code that needs to be documented. The tag usually includes a description of what needs to be documented and how it should be documented.

- `SECURITY`
  > Indicates code that needs to be reviewed for security vulnerabilities. The tag usually includes a description of the potential vulnerabilities and how they can be addressed.

- `BUG`
  > Indicates a piece of code that contains a bug or error that needs to be fixed. The tag usually includes a description of the bug and steps to reproduce it.

- `XXX`
  > Indicate code that may be incomplete, incorrect, or not working as intended. It is typically used to highlight issues that can cause errors, crashes, or other problems in the software. It is similar to the `TODO` tag but typically denotes a more serious issue that requires immediate attention.

- `NIT`
  > Indicates a small, minor issue or nitpick with the code that does not necessarily need to be fixed, but could be improved. The tag usually includes a description of the issue or nitpick.

- `NOTE`
  > Indicates code that contains a note or reminder for future reference. The tag usually includes a description of the note or reminder and may also include suggestions for how to address it. This tag can be useful for team members to communicate important information about the code.

## 2. Principle

- Clarity
  > Clear documentation comments help developers understand the code's intended functionality, how it works, and how to use it correctly, which is particularly important in complex projects or when dealing with legacy code.
  
- Maintainability
  > Documentation contributes to the code's maintainability, making it easier for developers to update, modify, or fix the code even if they were not the original authors. This ensures that the code remains relevant and can be extended or improved over time without introducing errors.

- Collaboration
  > Documentation promotes collaboration by allowing team members to understand each other's code, share knowledge, and work together more effectively. It serves as a reference for team members, facilitating communication and coordination in software development projects.

- Sparingly
  > Comments should only be used where necessary to provide additional context or documentation. Overuse of comments can make the code more difficult to read and understand, as irrelevant or unnecessary information can distract from the code.

- Consistent formatting
  > Consistent formatting of comments makes the code more readable and easier to understand. Use the same comment characters or symbols and indentation for all comments.

- Update
  > Comments should be updated as the code evolves to ensure that they remain accurate and up-to-date. Periodically review comments to ensure that they continue to provide accurate and useful information about the code.

## 3. Best Practice

### 3.1. Styles

- Context
  > Comments should be used to provide context about the code, explaining its purpose, functionality, and implementation details. Providing context helps other developers understand the code and makes it easier to maintain, especially when dealing with complex projects.

- Conciseness
  > Comments should be concise and focused, providing only the necessary information about the code. Avoid including unnecessary detail, which can make the code harder to read and understand. Keeping comments concise helps keep the code readable and easier to understand.

- Clear language
  > Comments should use clear and simple language that is easily understandable to other developers. Avoid using technical jargon or overly complex terms, as it can create confusion among developers who may not have the same level of technical expertise.

- Consistent formatting
  > Consistent formatting of comments helps make the code more readable and easier to understand. Use the same comment characters or symbols and indentation for all comments. Following consistent formatting makes it easier for developers to scan the code and quickly understand its structure.

- Meaningful names
  > Using meaningful names for variables, functions, and classes can reduce the need for comments by making the code more self-documenting. Meaningful names that reflect the code's purpose and functionality can help developers quickly understand what the code does without relying solely on comments.

- Avoid redundancy
  > Avoid including redundant comments that simply repeat what is already obvious from the code. This can make the code harder to read and understand, as well as increase the maintenance effort. Instead, focus on providing useful information that cannot be easily deduced from the code itself.

### 3.2. Tags

Consistency
  > To ensure consistency across the codebase, use the same tags throughout your code. This makes it easier to identify and search for code that needs attention and ensures that everyone on the team is on the same page.

Simplicity
  > Use short, descriptive tags that are easy to read and understand. Avoid using complicated tags or acronyms that may not be clear to everyone, keeping in mind that simplicity can help to make the code more readable and understandable.

Specificity
  > Use specific tags such as `TODO`, `FIXME`, and `BUG` to highlight specific issues in the code that need attention. This helps developers to prioritize their work and maintain the codebase.

Sparingly
  > Overusing comment tags can make the code harder to read and understand, so use tags only when necessary, such as when code needs to be fixed, tested, or documented.

Avoiding redundancy
  > Avoid using tags that duplicate existing functionality or are redundant. For example, using both `FIXME` and `BUG` tags to indicate the same issue is unnecessary and can make the code harder to read.

Regular review
  > Regularly review comment tags to ensure their relevance and necessity. Remove tags that are no longer needed and update or add new tags as necessary.
  >
## 4. Terminology

- Comment
  > A comment is a section of code that is not executed by the program, but is instead used to provide context or documentation about the code.

- Comment headers
  > Comment headers are blocks of comments that are used to provide an overview of a file or section of code. They typically include information about the author, date, purpose, and other relevant information.

- Comment blocks
  > Comment blocks are blocks of comments that are used to provide context or explanations about code. They can be used to provide a detailed explanation of a function, class, or other block of code.

- Comment tags
  > Comment tags are special keywords that are used to provide additional information about code. They are typically used to mark certain sections of code, such as `TODO` or `FIXME`, or to provide additional context about a block of code.

## 5. References

- Sentenz [docs as code](../about/docs-as-code.md) article.
- Wikipedia [comment](https://en.m.wikipedia.org/wiki/Comment_(computer_programming)) article.
