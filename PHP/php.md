# PHP Research

## What is PHP?
PHP (Hypertext Preprocessor) is a widely-used open-source scripting language designed primarily for web development. It is embedded in HTML and executed on the server side, making it useful for creating dynamic web pages and applications. PHP supports databases like MySQL, PostgreSQL, and SQLite, and is commonly used in content management systems like WordPress and Drupal. 

[Reference 1](https://www.php.net/manual/en/intro-whatis.php)

---

## What Are the Three Main Error Types in PHP?
PHP errors can generally be categorized into three main types:

1. **Notices**: These are minor errors that do not stop script execution. They usually indicate potential issues, like using an undefined variable.
   - Example: `echo $name; // Undefined variable`

2. **Warnings**: More serious than notices, warnings indicate that something is wrong but do not stop script execution.
   - Example: `include('non_existent_file.php'); // File not found warning`

3. **Fatal Errors**: These errors stop script execution immediately. They usually occur when calling undefined functions or using incorrect syntax.
   - Example: `nonExistentFunction(); // Fatal error`

[Reference 2](https://www.php.net/manual/en/errorfunc.constants.php)

---

## Echo vs Print
Both `echo` and `print` are used to output data in PHP, but they have slight differences:

- **echo**: Faster and can output multiple strings separated by commas. It does not return a value.
  ```php
  echo "Hello", " World!"; 
  ```
- **print**: Slower and returns `1`, meaning it can be used in expressions.
  ```php
  $result = print "Hello World!"; // $result will be 1
  ```

**Key Difference**: `echo` is faster and allows multiple outputs, while `print` returns a value and is slightly slower.

[Reference 3](https://www.php.net/manual/en/function.echo.php)

---

## 🌟 Sensitivity in PHP (Bonus)
### 1. **Case Sensitivity**
- Variable names in PHP are **case-sensitive**:
  ```php
  $name = "John";
  echo $NAME; // Undefined variable error
  ```
- Function names and class names are **not case-sensitive**:
  ```php
  function myFunction() {
      echo "Hello";
  }
  myfunction(); // Works fine
  ```

### 2. **Whitespace Sensitivity**
PHP generally ignores extra whitespace and newlines in code.
  ```php
  echo    "Hello    World"; // Works fine
  ```

### 3. **String Sensitivity**
PHP is case-sensitive in string comparison by default:
  ```php
  if ("Hello" == "hello") {
      echo "Equal";
  } else {
      echo "Not Equal"; // Output: Not Equal
  }
  ```

[Reference 4](https://www.php.net/manual/en/language.variables.basics.php)

---

Hope this helps! 😊
