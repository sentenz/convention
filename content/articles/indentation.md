# Indentation

Code indentation is a critical part of writing clean, readable, and maintainable software. It includes using `indentation styles` and `whitespace` (spaces or tabs) at the beginning of lines to visually separate statements by hierarchical level, typically within loops, conditionals, functions, and classes. Proper indentation improves readability and clearly communicates code structure and control flow.

- [1. Category](#1-category)
  - [1.1. Styles](#11-styles)
    - [1.1.1. K\&R Style (Kernighan \& Ritchie)](#111-kr-style-kernighan--ritchie)
    - [1.1.2. Allman Style (BSD Style)](#112-allman-style-bsd-style)
    - [1.1.3. OTBS (One True Brace Style)](#113-otbs-one-true-brace-style)
    - [1.1.4. GNU Style](#114-gnu-style)
    - [1.1.5. Whitesmiths Style](#115-whitesmiths-style)
    - [1.1.6. Python Style (PEP 8)](#116-python-style-pep-8)
  - [1.2. Whitespaces](#12-whitespaces)
    - [1.2.1. Tabs](#121-tabs)
    - [1.2.2. Spaces](#122-spaces)
- [2. Best Practices](#2-best-practices)
- [3. References](#3-references)

## 1. Category

### 1.1. Styles

#### 1.1.1. K&R Style (Kernighan & Ritchie)

The Kernighan & Ritchie (K&R) style is an indentation style widely used in C, C++, and Java. It was popularized by Brian Kernighan and Dennis Ritchie in the context of the C programming language.

1. Characteristics and Conventions

    - Braces
      > The opening brace `{` is placed on the same line as the control statement. The closing brace `}` is aligned with the control statement, on its own line.

    - Indentation
      > Indentation typically uses 4 spaces or a tab.

2. Examples and Explanations

    ```c
    #include <stdio.h>
    #include <stdbool.h>

    bool isPrime(int number) {
        if (number <= 1) return false;
        for (int i = 2; i < number; i++) {
            if (number % i == 0) return false;
        }
        return true;
    }

    int main() {
        int num = 29;
        if (isPrime(num)) {
            printf("%d is a prime number.\n", num);
        } else {
            printf("%d is not a prime number.\n", num);
        }
        return 0;
    }
    ```

#### 1.1.2. Allman Style (BSD Style)

The Allman style, also known as BSD style, is an indentation style used in many programming languages. It is named after Eric Allman. This style emphasizes readability by placing braces on separate lines, which makes block boundaries explicit.

1. Characteristics and Conventions

    - Braces
      > The opening brace `{` of a code block (such as `for` loops, `if` statements, or function definitions) is placed on its own line directly below the control statement. The closing brace `}` is placed on a new line at the same indentation level as the control statement, matching the position of the corresponding opening brace.

    - Indentation
      > The code within the block is indented, typically using either tabs or spaces (commonly 4 spaces), making the structure clear and organized.

2. Examples and Explanations

    ```c
    #include <stdio.h>
    #include <stdbool.h>

    bool isPrime(int number)
    {
        if (number <= 1)
            return false;
        for (int i = 2; i < number; i++)
        {
            if (number % i == 0)
                return false;
        }
        return true;
    }

    int main()
    {
        int num = 29;
        if (isPrime(num))
        {
            printf("%d is a prime number.\n", num);
        }
        else
        {
            printf("%d is not a prime number.\n", num);
        }
        return 0;
    }
    ```

#### 1.1.3. OTBS (One True Brace Style)

The One True Brace Style (OTBS), also known as `1TBS`, is a variant of the Kernighan & Ritchie (K&R) style and is widely used in C, C++, Java, and JavaScript. It is designed to maximize readability while minimizing vertical space usage.

1. Characteristics and Conventions

    - Braces
      > The opening brace `{` for control structures (e.g. `if`, `for`, `while`) is placed on the same line as the control statement. The closing brace `}` is aligned with the start of the control statement. The `else` or `else if` statements are placed on the same line as the closing brace of the preceding block.

    - Indentation
      > Blocks are typically indented using 4 spaces (or 1 tab, depending on project policy) to keep nesting levels clear.

2. Examples and Explanations

    ```c
    #include <stdio.h>
    #include <stdbool.h>

    bool isPrime(int number) {
        if (number <= 1) {
            return false;
        }
        for (int i = 2; i < number; i++) {
            if (number % i == 0) {
                return false;
            }
        }
        return true;
    }

    int main() {
        int num = 29;
        if (isPrime(num)) {
            printf("%d is a prime number.\n", num);
        } else {
            printf("%d is not a prime number.\n", num);
        }
        return 0;
    }
    ```

#### 1.1.4. GNU Style

GNU style is an indentation style that originates from the GNU project, primarily used in C and C++. It focuses on clarity and consistency, especially in large codebases.

1. Characteristics and Conventions

    - Braces
      > The opening brace `{` is placed on a new line, indented by two spaces. The closing brace `}` is aligned with the beginning of the statement that opens the block.

    - Indentation
      > Indentation is typically 2 spaces per level. This minimizes excessive indentation while maintaining clear visual separation between code blocks.

2. Examples and Explanations

    ```c
    #include <stdio.h>
    #include <stdbool.h>

    bool
    isPrime (int number)
    {
      if (number <= 1)
        return false;
      for (int i = 2; i < number; i++)
        {
          if (number % i == 0)
            return false;
        }
      return true;
    }

    int
    main (void)
    {
      int num = 29;
      if (isPrime (num))
        {
          printf ("%d is a prime number.\n", num);
        }
      else
        {
          printf ("%d is not a prime number.\n", num);
        }
      return 0;
    }
    ```

#### 1.1.5. Whitesmiths Style

The Whitesmiths style is an indentation style that aligns opening and closing braces `{}` with the indented block, rather than with the control structure or function header. It is notable for its visual alignment, making block boundaries very explicit.

1. Characteristics and Conventions

    - Braces
      > The opening and closing braces `{}` are placed on new lines, and they are indented to the same level as the code inside the block. This means the braces appear aligned with the block of code they contain, rather than with the control structure or function header.

    - Indentation
      > Code inside a block is indented further than the braces, usually with a standard indentation width (typically 4 spaces or a tab).

2. Examples and Explanations

    ```c
    #include <stdio.h>
    #include <stdbool.h>

    bool isPrime(int number)
        {
            if (number <= 1)
                return false;
            for (int i = 2; i < number; i++)
                {
                    if (number % i == 0)
                        return false;
                }
            return true;
        }

    int main()
        {
            int num = 29;
            if (isPrime(num))
                {
                    printf("%d is a prime number.\n", num);
                }
            else
                {
                    printf("%d is not a prime number.\n", num);
                }
            return 0;
        }
    ```

#### 1.1.6. Python Style (PEP 8)

Python's style guide, PEP 8, provides guidelines for writing readable and maintainable Python code. Indentation is a core part of these guidelines because Python uses indentation to define code blocks. Following PEP 8 improves readability and helps prevent structural errors.

1. Characteristics and Conventions

    - Braces
      > Python relies entirely on indentation for defining code blocks, without the use of braces `{}`.

    - Indentation
      > Use consistent indentation (commonly 4 spaces) to define blocks. Tabs are discouraged, and incorrect indentation causes syntax errors.

2. Examples and Explanations

    ```python
    def is_prime(number):
        if number <= 1:
            return False
        for i in range(2, number):
            if number % i == 0:
                return False
        return True

    def main():
        num = 29
        if is_prime(num):
            print(f"{num} is a prime number.")
        else:
            print(f"{num} is not a prime number.")

    if __name__ == "__main__":
        main()
    ```

### 1.2. Whitespaces

#### 1.2.1. Tabs

Tabs refer to using the tab character `\t` for indentation.

1. Characteristics and Conventions

    - Character
      > A single tab character `\t` represents one indentation level in the code. The visual width is usually shown as 4 or 8 spaces, depending on editor configuration.

    - Efficiency
      > Tabs can be faster to insert because one keypress adds a full indentation level.

    - Accessibility
      > Each developer can configure editor tab width based on personal preference (e.g. 4 spaces or 8 spaces). This flexibility can improve readability without changing source content.

    - File Size
      > Because a tab is a single character, files can be slightly smaller than space-indented equivalents.

2. Examples and Explanations

    ```c
    if (condition)
    →do_something()
    ```

#### 1.2.2. Spaces

Spaces refer to using space characters for code indentation.

1. Characteristics and Conventions

    - Fixed Width
      > Each space character has a uniform width, making indentation levels predictable.

    - Configurable Indentation Levels
      > Projects typically use 2 or 4 spaces per indentation level, depending on the style guide.

    - Consistency
      > Spaces avoid visual differences caused by editor-specific tab-width settings.

2. Examples and Explanations

    ```c
    if (condition)
    ··do_something()
    ```

## 2. Best Practices

- Readability
  > Code that is indented consistently is easier to read and understand.

- Maintainability
  > Proper indentation makes code easier to debug, review, and extend over time.

- Consistency
  > Choose one style and apply it consistently throughout the project.

- Linters and Formatters
  > Use tools like ESLint, Prettier, or clang-format to enforce indentation and formatting rules automatically.

- Team Collaboration
  > Agree on a common indentation style to keep the codebase uniform.

## 3. References

- JetBrains [Tabs vs Spaces](https://blog.jetbrains.com/dotnet/2022/08/11/virtual-formatter-in-resharper-2022-2/) page.
- Reddit [Tabs vs Spaces](https://www.reddit.com/r/javascript/comments/c8drjo/nobody_talks_about_the_real_reason_to_use_tabs/) page.
- Medium [Tabs vs Spaces](https://medium.com/@hoffa/400-000-github-repositories-1-billion-files-14-terabytes-of-code-spaces-or-tabs-7cfe0b5dd7fd#.j6ki2b7og) page.
