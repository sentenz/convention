# CRLF vs LF

CRLF and LF are line ending characters that are used to represent the end of a line of text in text files.

CRLF (Carriage Return and Line Feed) is a combination of the characters `carriage return` (ASCII 13, \r) and `line feed` (ASCII 10, \n), used to represent a line break in Windows based systems.

LF (Line Feed) is the character `line feed` (ASCII 10, \n) is used to represent a line break in Unix and Unix-based systems, such as Linux and macOS.

The use of line ending characters is important for text processing, as it helps to distinguish between the end of a line of text and the end of a file. The use of different line ending characters can lead to compatibility issues, especially when transferring files between different operating systems. This can be resolved by standardizing the line ending representation to a specific format, such as using only LF characters.

- [1. Normalizing Line Endings](#1-normalizing-line-endings)
- [2. References](#2-references)

## 1. Normalizing Line Endings

In a Git-based version control software (VCS), create a [.gitattributes](https://git-scm.com/docs/gitattributes) file in the root of the repo to normalize line endings. This configuration-based approach ensures that line endings remain consistent across the code base, regardless of which operating systems or local Git settings developers use, because this file takes priority.

The following `.gitattributes` config normalizes line endings to `LF` for all text files checked into a repo while leaving local line endings untouched in the working tree:

```bash
# Set the default behavior, in case don't have core.autocrlf set.
* text=auto

# Declare files that will always have LF line endings on checkout.
*.sh text eol=lf

# Declare files that will always have CRLF line endings on checkout.
*.sln text eol=crlf
*.bat text eol=crlf

# Denote all files that are truly binary and should not be modified.
*.png binary
*.jpg binary
```

## 2. References

- Git [end-of-line conversion](http://git-scm.com/docs/gitattributes#_end_of_line_conversion) article.
- Blog [CRLF vs LF](https://www.aleksandrhovhannisyan.com/blog/crlf-vs-lf-normalizing-line-endings-in-git/) article.
- OWASP [CRLF Injection](https://owasp.org/www-community/vulnerabilities/CRLF_Injection) article.
