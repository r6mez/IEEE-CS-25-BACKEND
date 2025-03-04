# PHP Research

## What is PHP?
PHP (Hypertext Preprocessor) is a widely-used open-source scripting language designed primarily for web development. It is embedded in HTML and executed on the server side, making it useful for creating dynamic web pages and applications. PHP supports databases like MySQL, PostgreSQL, and SQLite, and is commonly used in content management systems like WordPress and Drupal. 

[References](https://www.php.net/manual/en/intro-whatis.php)

---

## What Are the Three Main Error Types in PHP?
PHP errors can generally be categorized into three main types:

1. **Notices**: These are minor errors that do not stop script execution. They usually indicate potential issues, like using an undefined variable.
   - Example: `echo $name; // Undefined variable`

2. **Warnings**: More serious than notices, warnings indicate that something is wrong but do not stop script execution.
   - Example: `include('non_existent_file.php'); // File not found warning`

3. **Fatal Errors**: These errors stop script execution immediately. They usually occur when calling undefined functions or using incorrect syntax.
   - Example: `nonExistentFunction(); // Fatal error`

[References](https://www.php.net/manual/en/errorfunc.constants.php)

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

[References](https://www.php.net/manual/en/function.echo.php)

---

## Sensitivity in PHP
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

[References](https://www.php.net/manual/en/language.variables.basics.php)

---

## Programming Language vs Scripting Language  

A **programming language** is a formal set of instructions used to develop software applications. It includes compiled languages like C, C++, and Java, which require a compiler to convert code into machine language before execution.  

A **scripting language**, on the other hand, is a type of programming language designed for automating tasks within an existing system. Scripting languages like Python, JavaScript, and Bash are usually interpreted, meaning they are executed line by line without the need for compilation.  

Compiled programming languages are generally faster than interpreted scripting languages.  

[References](https://www.geeksforgeeks.org/difference-between-programming-language-and-scripting-language/)  

---  

## Dynamically Typed vs Statically Typed Languages  

### Dynamically Typed Languages  
Dynamically typed languages do not require variable types to be declared explicitly. The type is determined at runtime. Examples include Python, JavaScript, and Ruby.  

### Statically Typed Languages  
Statically typed languages require explicit type declarations. The type is checked at compile time. Examples include C, Java, and Go.  


[References](https://www.freecodecamp.org/news/dynamic-vs-static-typing/)  

---  

## Assign by Value vs Assign by Reference  

### Assign by Value  
When a variable is assigned by value, a copy of the value is created, meaning changes to one variable do not affect the other. Primitive types like integers, floats, and booleans in languages like JavaScript, Python, and Java are assigned by value.  

### Assign by Reference  
In reference assignment, the variable stores the memory address of an object rather than a copy of its value. Changes to one variable affect all references to that object. Objects, arrays, and functions are typically assigned by reference in languages like JavaScript and Python.  

```php
<?php
$a = 10;
$b = $a; // Assign by value
$b = 20; // Changing $b doesn't affect $a
echo "Value of a: $a\n"; // Output: 10

$c = 10;
$d = &$c; // Assign by reference
$d = 20; // Changing $d also changes $c
echo "Value of c: $c\n"; // Output: 20
?>
```

[References](https://www.javascripttutorial.net/javascript-pass-by-value-vs-pass-by-reference/)  

---
## Difference Between `for` and `foreach` Loop in PHP

### `for` Loop in PHP

The `for` loop is typically used when the number of iterations is known beforehand. It consists of three parts:  
1. **Initialization** – Defines the starting value of the loop variable.  
2. **Condition** – Specifies the condition that must be met for the loop to continue executing.  
3. **Increment/Decrement** – Modifies the loop variable after each iteration.  

#### Syntax:
```php
for ($i = 0; $i < 5; $i++) {
    echo "Iteration: $i <br>";
}
```

### `foreach` Loop in PHP

The `foreach` loop is specifically designed for iterating over arrays and objects. Unlike `for`, it directly assigns each element of the array to a variable without requiring an index, So it's used when:
- When dealing with arrays or objects.
- When you don't need a loop counter and want to work with values directly.

#### Syntax:
```php
$colors = ["Red", "Green", "Blue"];
foreach ($colors as $color) {
    echo "Color: $color <br>";
}
```
References
- [PHP for Loop (W3Schools)](https://www.w3schools.com/php/php_looping_for.asp)
- [PHP foreach Loop (W3Schools)](https://www.w3schools.com/php/php_looping_foreach.asp)

---
## Sessions vs. Cookies

Sessions and cookies are both used to store user-related data, but they work differently.

### **Sessions**
- A session is a way to store user data on the server.
- It creates a unique session ID for each user.
- Data is stored temporarily and is accessible across multiple pages until the session expires or is destroyed.
- Sessions are useful for storing sensitive data since they are not stored on the client-side.

### **Cookies**
- Cookies are small text files stored on the user's device.
- They are used to remember user preferences, login details, and other data across sessions.
- Cookies have an expiration date and can persist even after the browser is closed.
- Since cookies are stored on the client side, they can be accessed and modified by the user, making them less secure compared to sessions.

[References](https://www.geeksforgeeks.org/difference-between-session-and-cookie/)

---

## Error Handling in PHP

### **Types of Errors**
1. **Notices** – Minor errors that do not stop script execution (e.g., accessing an undefined variable).
2. **Warnings** – More serious than notices, but the script still continues (e.g., including a missing file).
3. **Fatal Errors** – Critical errors that stop script execution (e.g., calling a non-existent function).
4. **Parse Errors** – Syntax errors detected before execution.

### **Handling Errors in PHP**
- **Using `error_reporting()`** – Controls which errors PHP reports.
  ```php
  error_reporting(E_ALL);
  ```
- **Using `set_error_handler()`** – Custom error handler function.
  ```php
  function customError($errno, $errstr) {
      echo "Error: [$errno] $errstr";
  }
  set_error_handler("customError");
  ```
- **Using `try...catch` for Exception Handling**
  ```php
  try {
      if (!file_exists("file.txt")) {
          throw new Exception("File not found");
      }
  } catch (Exception $e) {
      echo "Error: " . $e->getMessage();
  }
  ```
- **Logging Errors** – Errors can be logged instead of displaying them.
  ```php
  ini_set('log_errors', 1);
  ini_set('error_log', 'errors.log');
  ```

[References](https://www.php.net/manual/en/errorfunc.configuration.php)

---

## How PHP Executes Code

PHP executes code in a step-by-step process known as the PHP lifecycle.

### **PHP Execution Process**
1. **Request Handling** – When a user requests a PHP page, the server processes the request.
2. **Lexing & Parsing** – PHP converts the script into tokens and then builds an Abstract Syntax Tree (AST).
3. **Compilation to Opcodes** – PHP compiles the AST into intermediate bytecode (opcodes) for faster execution.
4. **Execution by Zend Engine** – The Zend Engine interprets and executes the opcodes.
5. **Output Handling** – The final output is sent to the browser.

### **PHP Execution Modes**
- **Web Server Execution** – PHP runs within a web server like Apache or Nginx.
- **CLI (Command Line Interface) Execution** – PHP scripts can be executed in a terminal.
- **Embedded PHP** – PHP can be embedded within other applications.

[References](https://www.php.net/manual/en/internals2.php)