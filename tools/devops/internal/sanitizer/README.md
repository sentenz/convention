# `/sanitizer`

- [1. Valgrind](#1-valgrind)

## 1. Valgrind

[Valgrind](https://www.valgrind.org/) is an instrumentation framework for building dynamic analysis tools. There are Valgrind tools that can automatically detect many memory management and threading bugs, and profile your programs in detail.

The Valgrind distribution currently includes seven production-quality tools: a memory error detector, two thread error detectors, a cache and branch-prediction profiler, a call-graph generating cache and branch-prediction profiler, and two different heap profilers.

Related:

- [valgrind - github](https://github.com/tklengyel/valgrind)

### 22.1. Requirements

`apt` package management system for installing, upgrading, configuring, and removing software.

### 22.2. Install

```bash
sudo apt install -y valgrind
```

### 22.3. Usage

Valgrind [manual-core](https://valgrind.org/docs/manual/manual-core.html) describes the Valgrind core services, command-line options and behaviours.

```bash
# Run valgrind memory error detector
valgrind --tool=memcheck --leak-check=full --show-leak-kinds=all --track-origins=yes --show-reachable=yes --error-limit=no -q ./<executable>
```

### 22.4. Configuration

When running valgrind, it will check in the current directory for a file named `~/.valgrindrc` or `./.valgrindrc` (or a file specified via `--suppressions=<filename>`).

```bash
# Generating valgrind memory leak suppression file
valgrind --tool=memcheck --leak-check=full --show-leak-kinds=all --track-origins=yes --show-reachable=yes --error-limit=no --gen-suppressions=all --log-file=valgrind.log ./<executable>
```

Example of a `.valgrindrc` file containing:

```txt
--memcheck:leak-check=full
--show-reachable=yes
--suppressions=/home/david/devel/wxGTK-2.8.12.supp
--suppressions=/home/david/devel/wxGTK-2.9.supp
```
