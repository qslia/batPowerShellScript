In Windows batch (`.bat`) files, you can add comments (annotations) in a couple of ways:

### 1. Using `REM`

The traditional way is with the `REM` (remark) command:

```bat
REM This is a comment
echo Hello World
```

### 2. Using double colons `::`

A shorter and often preferred method is to start the line with two colons:

```bat
:: This is also a comment
echo Hello World
```

⚠️ **Notes about `::` comments:**

* `::` works because it is treated as a special label, but it’s not an official command like `REM`.
* In most cases it behaves like a comment, but inside parentheses (e.g., within `IF` or `FOR` blocks), `::` may not always work as expected. In those cases, use `REM`.

### Example:

```bat
@echo off
REM This script prints Hello World
:: Another way to comment
echo Hello World

if exist "test.txt" (
    REM This comment works safely inside parentheses
    echo test.txt found
)
```

👉 Rule of thumb:

* Use `::` for quick one-line notes.
* Use `REM` when inside conditional/loop blocks, or if you want maximum compatibility.

Do you want me to also show you how to **add multi-line block comments** in batch scripts (like we do in other languages), even though `.bat` doesn’t officially support them?
