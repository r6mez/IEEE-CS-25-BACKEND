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