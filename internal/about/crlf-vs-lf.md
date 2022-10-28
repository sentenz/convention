# CRLF vs LF

The term CRLF refers to Carriage Return (ASCII 13, \r) Line Feed (ASCII 10, \n). They’re used to note the termination of a line. Windows both a CR and LF are required to note the end of a line, whereas in Linux/UNIX a LF is only required.

- [1. Normalizing Line Endings](#1-normalizing-line-endings)
- [2. See also](#2-see-also)

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

## 2. See also

- Git [end-of-line conversion](http://git-scm.com/docs/gitattributes#_end_of_line_conversion) article.
- Blog [CRLF vs LF](https://www.aleksandrhovhannisyan.com/blog/crlf-vs-lf-normalizing-line-endings-in-git/) article.
- OWASP [CRLF Injection](https://owasp.org/www-community/vulnerabilities/CRLF_Injection) article.
