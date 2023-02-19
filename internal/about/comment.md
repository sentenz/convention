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

- Single-Line Comments
  > Single-line comments are a concise way to provide brief explanations or clarifications about particular lines of code. They are commonly used to explain the purpose of a particular variable or function call, or to provide additional context about how a specific piece of code works. Single-line comments are often preceded by a special character or symbol, such as `//` or `#`, and are useful for providing quick, concise documentation.

- Multi-Line Comments
  > Multi-line comments are a more extensive form of documentation that can be used to describe large sections of code or to provide detailed explanations about particular algorithms or data structures. They are often enclosed in a special block of characters or symbols, such as `/* ... */`, `''' ... '''`, or preceded by a triple forward slash `///` and can be used to provide comprehensive documentation for complex sections of code.

- Documentation Comments
  > Documentation comments are a special type of comment that is used to generate documentation for the code. They are often used to describe functions, classes, or other components of the code, and can be automatically extracted to create documentation that can be shared with other developers. Documentation comments are a critical tool for ensuring that code is well-documented and easy to understand, and can help developers quickly understand the purpose and functionality of different parts of the code.

- Comment Tags
  > Comment tags are used to indicate that a particular section of code requires attention or modification. They often include tags like `TODO`, `FIXME`, or `HACK`, and are used to help developers quickly identify sections of code that need to be addressed. Comment tags are useful for ensuring that code is continuously updated and maintained, and can help prevent issues from arising in the future.

- Inline Comments
  > Inline comments are inserted directly into the code and are used to provide explanations or clarifications about specific lines or sections of code. They are often used to describe complex algorithms or to provide context for particular sections of code. Inline comments are useful for providing additional context and can help make code more readable and understandable for other developers.

### 1.2. Tags

Comment tags in programming are used to annotate code with additional information or notes that can help developers better understand, maintain, and improve the code. These tags usually take the form of a specific syntax, such as a double slash `//` in most programming languages, and are followed by a specific keyword or label that indicates the type of comment.

Comment tags are helpful in managing large codebases or collaborative projects, as they track specific issues, tasks, or requirements.

- TODO
  > Indicates code that needs to be completed or implemented. The tag usually includes a description of what needs to be done to complete the task.

- FIX
  > Indicates code that needs to be fixed. The tag usually includes a description of what is wrong with the code.

- HACK
  > Indicates code that is a quick and dirty solution to a problem. The tag usually includes a description of why the code is a hack and what needs to be done to create a more permanent solution.

- OPTIMIZE
  > Indicates code that needs to be optimized for performance or memory usage. The tag usually includes a description of how the code can be optimized.

- REFACTOR
  > Indicates code code that needs to be refactored to improve its structure or organization. The tag usually includes a description of how the code can be refactored.

- REVIEW
  > Indicates code that needs to be reviewed by other programmers. The tag usually includes a description of what needs to be reviewed.

- DEBUG
  > Indicates code that needs to be debugged. The tag usually includes a description of the problem and any steps that have been taken to debug the code.

- DOC
  > Indicates code that needs to be documented. The tag usually includes a description of what needs to be documented and how it should be documented.

- SECURITY
  > Indicates code that needs to be reviewed for security vulnerabilities. The tag usually includes a description of the potential vulnerabilities and how they can be addressed.

- BUG
  > Indicates a piece of code that contains a bug or error that needs to be fixed. The tag usually includes a description of the bug and steps to reproduce it.

- XXX
  > Indicate code that may be incomplete, incorrect, or not working as intended. It is typically used to highlight issues that can cause errors, crashes, or other problems in the software. It is similar to the `TODO` tag but typically denotes a more serious issue that requires immediate attention.

- NIT
  > Indicates a small, minor issue or nitpick with the code that does not necessarily need to be fixed, but could be improved. The tag usually includes a description of the issue or nitpick.

- NOTE
  > Indicates code that contains a note or reminder for future reference. The tag usually includes a description of the note or reminder and may also include suggestions for how to address it. This tag can be useful for team members to communicate important information about the code.

## 2. Principle

- Use Comments Sparingly
  > Overuse of comments can clutter code and make it more difficult to read and understand. This is because comments can sometimes provide irrelevant or unnecessary information that distracts from the code. Therefore, it is important to use comments only where they are necessary to provide additional context or documentation.

- Be clear and concise
  > Comments should be clear, concise, and to the point. They should provide information that is relevant to the code and should avoid unnecessary information or ambiguity. Developers should strive to use language that is easily understandable and avoids technical jargon or overly complex terminology.

- Use Consistent Formatting
  > Consistent formatting makes code more readable and easier to understand. Developers should strive to use the same formatting for all comments in a codebase, including the use of the same comment characters or symbols and indentation.

- Use comment tags appropriately
  > Comment tags, such as `TODO`, `FIXME`, or `HACK`, should be used sparingly and only where they are necessary. Developers should avoid using comment tags as a substitute for fixing issues in the code and should prioritize addressing issues as they arise.

- Use Documentation Comments Effectively
  > Documentation comments should be used to ensure that code is well-documented and easily understood. Developers should strive to use documentation comments consistently and to provide comprehensive and useful information that will be helpful to other developers.

- Update comments as code Evolves
  > Comments should be updated as code evolves, to ensure that they remain accurate and up-to-date. Developers should make a point of reviewing comments periodically to ensure that they continue to provide accurate and useful information about the code.

## 3. Best Practice

### 3.1. Styles

- Use comments to provide context
  > Comments should be used to provide context about the code, explaining what it does, why it does it, and how it does it. This helps other developers understand the code and makes it easier to maintain.

- Be concise
  > Comments should be concise and to the point, providing relevant information about the code without unnecessary detail. This helps keep the code readable and makes it easier to understand.

- Use clear and simple language
  > Comments should use clear and simple language that is easily understandable to other developers. Avoid using technical jargon or overly complex terms.

- Follow consistent formatting
  > Consistent formatting of comments helps make the code more readable and easier to understand. Use the same comment characters or symbols and indentation for all comments.

- Use meaningful names
  > Meaningful names for variables, functions, and classes can reduce the need for comments by making the code more self-documenting.

- Avoid redundant comments
  > Avoid comments that simply repeat what is already obvious from the code. This can make the code harder to read and understand.

### 3.2. Tags

- Be consistent
  > Use the same tags throughout your codebase to ensure that everyone on the team is on the same page. This makes it easier to search for and identify code that needs attention.

- Keep it simple
  > Use short, descriptive tags that are easy to read and understand. Avoid using overly complicated tags or acronyms that may not be clear to everyone.

- Be specific
  > Use tags like `// TODO`, `// FIXME`, and `// BUG` to indicate specific issues in the code that need attention. This makes it easier for developers to prioritize their work and ensures that the code is well-maintained.

- Use them sparingly
  > Don't overuse comment tags, as this can make the code harder to read and understand. Only use tags when they are really needed, such as when code needs to be fixed, tested, or documented.

- Avoid redundancy
  > Don't use tags that duplicate existing functionality or are redundant. For example, using both `// FIXME` and `// BUG` tags to indicate the same issue is not necessary and can make the code harder to read.

- Review tags regularly
  > Regularly review comment tags to ensure that they are still relevant and necessary. Remove tags that are no longer needed, and update or add new tags as needed.

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

- Wikipedia [comment](https://en.m.wikipedia.org/wiki/Comment_(computer_programming)) article.
