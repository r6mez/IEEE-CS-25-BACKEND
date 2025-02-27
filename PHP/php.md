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
