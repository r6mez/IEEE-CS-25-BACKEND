# Object-Oriented Programming (OOP) Research

## Who Invented OOP and Why?
Who? **Alan Kay** in the late 1960s and early 1970s while working on the **Smalltalk** programming language at Xerox PARC. 

Why? The idea behind OOP was inspired by biological cells and the way they interact. Kay believed that software should be designed in a way where small, self-contained objects communicate with each other, leading to more modular, reusable, and maintainable code.

[References](https://en.wikipedia.org/wiki/Smalltalk)

## The main 4 princples of OOP:
- Encapsulation
- Abstraction
- Inheritence
- Polymorphism

## Encapsulation & Abstraction


- **Encapsulation** refers to restricting access to certain details of an object and only exposing the necessary functionalities. This is achieved using access modifiers like `private`, `protected`, and `public`.
- **Abstraction** is the concept of hiding complex implementation details and exposing only the essential features to the user. 

Example in PHP:
```php
class Car {
    private $engineStatus = false;

    public function startEngine() {
        $this->engineStatus = true;
        echo "Engine started!";
    }

    public function stopEngine() {
        $this->engineStatus = false;
        echo "Engine stopped!";
    }
}
```
- [Reference 1](https://www.geeksforgeeks.org/difference-between-abstraction-and-encapsulation-in-java-with-examples/)
- [References 2](https://www.w3schools.com/php/php_oop_access_modifiers.asp)

## Inheritance
**Inheritance** allows a class to inherit properties and methods from another class. The main advantage of inheritance is **code reuse**. In PHP, inheritance is achieved using the `extends` keyword.

Example:
```php
class Animal {
    public function makeSound() {
        echo "Some generic sound";
    }
}

class Dog extends Animal {
    public function makeSound() {
        echo "Bark!";
    }
}

$dog = new Dog();
$dog->makeSound(); // Outputs: Bark!
```
[References](https://www.php.net/manual/en/language.oop5.inheritance.php)

## PHP Interfaces & Polymorphism
- **Interfaces** in PHP define a contract that classes must follow. A class implementing an interface must define all of its methods.
- **Polymorphism** allows different classes to be treated as instances of the same class through a common interface.

Example:
```php
interface Animal {
    public function makeSound();
}

class Cat implements Animal {
    public function makeSound() {
        echo "Meow!";
    }
}

class Dog implements Animal {
    public function makeSound() {
        echo "Bark!";
    }
}

function soundTest(Animal $animal) {
    $animal->makeSound();
}

$cat = new Cat();
$dog = new Dog();

soundTest($cat); // Meow!
soundTest($dog); // Bark!
```
[References](https://www.w3schools.com/php/php_oop_interfaces.asp)

## PHP Traits
PHP does not support multiple inheritance, but **Traits** allow code reuse across multiple classes without traditional inheritance. Traits are similar to classes but cannot be instantiated on their own.

Example:
```php
trait Logger {
    public function log($message) {
        echo "Log: $message";
    }
}

class User {
    use Logger;
}

$user = new User();
$user->log("User created!"); // Outputs: Log: User created!
```
[References](https://www.php.net/manual/en/language.oop5.traits.php)

---
## Late Static Binding & How It Works

Late Static Binding (LSB) is a feature in PHP that allows for more flexible method inheritance in object-oriented programming. It addresses limitations in early binding, where the class context is fixed at compile time, by deferring the binding to runtime. This ensures that static references in parent classes refer to the calling subclass, enabling more dynamic and accurate behavior in complex class hierarchies.

For example, consider a base class with a static method intended to return an instance of the subclass that calls it. Using `self::` would refer to the base class, but with LSB, `static::` ensures the method references the correct subclass.

```php
<?php
class Base {
    public static function create() {
        return new static();
    }
}

class Child extends Base {}

$instance = Child::create();
var_dump($instance); // Outputs: object(Child)#1
?>
```

In this example, `Child::create()` returns an instance of `Child`, demonstrating the effect of late static binding.

[Reference: PHP Manual on Late Static Bindings](https://www.php.net/manual/en/language.oop5.late-static-bindings.php).

## Using OOP with MySQL (PDO & MySQLi)

**PDO** provides a consistent interface for accessing various databases, including MySQL. It supports prepared statements, which enhance security by preventing SQL injection attacks.

Example of a PDO connection class using the Singleton pattern:

```php
<?php
class Database {
    private static $instance = null;
    private $pdo;

    private function __construct() {
        $dsn = 'mysql:host=localhost;dbname=example';
        $username = 'root';
        $password = '';
        $this->pdo = new PDO($dsn, $username, $password);
    }

    public static function getInstance() {
        if (self::$instance === null) {
            self::$instance = new self();
        }
        return self::$instance;
    }

    public function getConnection() {
        return $this->pdo;
    }
}
?>
```

This pattern ensures a single database connection instance, optimizing resource usage.

**MySQLi** also supports OOP and offers both procedural and object-oriented interfaces. It provides functionalities like prepared statements and multiple statements execution.

Example of using MySQLi with OOP:

```php
<?php
$mysqli = new mysqli('localhost', 'user', 'password', 'database');

$stmt = $mysqli->prepare('SELECT * FROM users WHERE id = ?');
$stmt->bind_param('i', $id);
$stmt->execute();
$result = $stmt->get_result();
$data = $result->fetch_assoc();
?>
```

[Reference: Phppot's tutorial](https://phppot.com/php/how-to-create-php-crud-using-oops-with-mysqli-in-mvc/).

## Factory Pattern

The Factory Pattern is a creational design pattern that provides an interface for creating objects in a superclass but allows subclasses to alter the type of objects that will be created. This promotes loose coupling and adheres to the Open/Closed Principle.

In PHP, the Factory Pattern can be implemented as follows:

```php
<?php
abstract class Product {
    abstract public function getType();
}

class ConcreteProductA extends Product {
    public function getType() {
        return 'Type A';
    }
}

class ConcreteProductB extends Product {
    public function getType() {
        return 'Type B';
    }
}

class Factory {
    public static function create($type) {
        switch ($type) {
            case 'A':
                return new ConcreteProductA();
            case 'B':
                return new ConcreteProductB();
            default:
                throw new Exception('Invalid product type.');
        }
    }
}

$product = Factory::create('A');
echo $product->getType(); // Outputs: Type A
?>
```

This pattern is particularly useful when the exact type of object isn't known until runtime.

[Reference 1](https://refactoring.guru/design-patterns/factory-method)

## Anonymous Classes

Anonymous classes are classes without a name, introduced in PHP 7. They are useful for one-time use or simple object instantiation without the need for a full class definition. Anonymous classes can implement interfaces, extend other classes, and include properties and methods.

Example of an anonymous class:

```php
<?php
interface Logger {
    public function log($message);
}

$logger = new class implements Logger {
    public function log($message) {
        echo $message;
    }
};

$logger->log('Hello, World!');
?>
```

In this example, an anonymous class implements the `Logger` interface and provides the `log` method.

[Reference](https://www.php.net/manual/en/language.oop5.anonymous.php)

## MVC Architecture

Model-View-Controller (MVC) is a software architectural pattern that separates an application into three main components:

- **Model**: Manages the data and business logic.
- **View**: Handles the presentation layer and user interface.
- **Controller**: Acts as an intermediary between Model and View, processing user input and updating the Model and View accordingly.

This separation promotes organized code, easier maintenance, and scalability.

In a PHP application, the flow typically works as follows:

1. **User Interaction**: The user interacts with the View (e.g., submitting a form).
2. **Controller Processing**: The Controller handles the input, interacts with the Model to process data, and determines the appropriate View to display.
3. **Model Update**: The Model updates the data and business logic as necessary.
4. **View Rendering**: The View renders the updated data to the user.

[References](https://www.geeksforgeeks.org/mvc-framework-introduction/)

---
