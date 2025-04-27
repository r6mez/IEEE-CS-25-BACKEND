# Laravel Research Notes

## Request Lifecycle

When a user makes a request to a Laravel application (like clicking a link or submitting a form), a series of steps happen behind the scenes to handle that request and return a response. This process is called the **Request Lifecycle**.

Here's a quick breakdown:

1. **Entry Point**: Everything starts in the `public/index.php` file.
2. **HTTP Kernel**: Laravel loads the `App\Http\Kernel` class, which handles HTTP requests.
3. **Middleware**: Laravel passes the request through global and route middleware. These can modify or reject the request (like checking if you're logged in).
4. **Routing**: The request is matched to a route.
5. **Controller/Closure Execution**: The matched route points to a controller method or a closure function, which contains the logic.
6. **Response**: The controller returns a response (e.g., HTML or JSON), which is then sent back to the browser.

> It's like a factory assembly line — the request is processed, passed through filters, matched, handled, and sent back.

[References](https://laravel.com/docs/12.x/lifecycle)

---

## Routing in Laravel

**Routing** in Laravel defines how the application responds to various URLs or endpoints. It's like a map — you tell Laravel, “when someone visits `/home`, run this code.”

Routes are defined in `routes/web.php` for web routes and `routes/api.php` for API routes.

### Basic Example:
```php
Route::get('/home', function () {
    return view('home');
});
```

### Types of Routes:
- `GET`, `POST`, `PUT`, `DELETE`
- Route groups with middleware
- Route parameters like `/user/{id}`
- Named routes for convenience
- Controller routes like: `Route::get('/users', [UserController::class, 'index']);`

[References](https://laravel.com/docs/12.x/routing)

---

## Facades

**Facades** in Laravel are like shortcuts or "static-like" interfaces to classes that are available in the service container. They're super handy for quickly accessing commonly used features like caching, queues, routing, etc.

For example, instead of doing:
```php
$app->make('Illuminate\Support\Facades\Cache')->get('key');
```
You can just do:
```php
Cache::get('key');
```

### Some Common Facades:
- `DB` for database queries
- `Cache` for caching
- `Auth` for authentication
- `Route` for routing

Even though they look static, under the hood, they use Laravel's service container to resolve real instances. So you get the flexibility of dependency injection with the convenience of static methods.

[References](https://laravel.com/docs/12.x/facades)

---
## Blade Templates and how it works

### What is Blade in Laravel?
Blade is Laravel’s built-in template engine that allows developers to write dynamic HTML with embedded PHP in a more readable and maintainable way. Unlike traditional PHP templates, Blade provides template inheritance and reusable components, making development much more efficient.

### Setting Up Blade in Laravel

Blade templates are stored in the resources/views/ directory. By default, Laravel uses .blade.php extensions for Blade files.

For example, you can create a layout file:

```html
// resources/views/layouts/main.blade.php
<!DOCTYPE html>
<html>
<head>
    <title>@yield('title')</title>
</head>
<body>
    <header>
        <h1>My Laravel App</h1>
    </header>
    <main>
        @yield('content')
    </main>
    <footer>
        <p>&copy; 2025 My Laravel App</p>
    </footer>
</body>
</html>
```

Then, a child view can extend this layout:

```php
// resources/views/home.blade.php
@extends('layouts.main')

@section('title', 'Home Page')

@section('content')
    <h2>Welcome to my Laravel app!</h2>
@endsection

Rendering a Blade View in a Controller

To display the home.blade.php file, define a route and return the view:

use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('home');
});
```
[references](https://dev.to/icornea/laravel-blade-template-engine-a-beginners-guide-54bi)

---

## What is ORM and Why it is So Useful

ORM stands for **Object-Relational Mapping**. It’s basically a way to interact with a database using **objects** instead of writing raw SQL queries all the time. In simple words, you represent your database tables as classes, and rows become instances of those classes.

For example, instead of doing:

```sql
SELECT * FROM users WHERE id = 1;
```

You can just do:

```php
$user = User::find(1);
```

in Laravel (which uses **Eloquent ORM**).

Why is ORM so useful?
- **Simplifies Database Interaction**: You don't have to write complex SQL queries manually.
- **Readable and Maintainable Code**: Code looks cleaner and more understandable.
- **Database Abstraction**: You can often switch databases (like from MySQL to PostgreSQL) with minimal changes.
- **Security**: ORMs usually help prevent SQL Injection automatically by binding parameters properly.
- **Productivity**: You can build applications faster because you spend less time thinking about the database layer.

However, some people say that for very complex queries, sometimes raw SQL can still be better for performance. So it’s not always 100% magical, but in most cases, ORMs make life way easier.

[References](https://laravel.com/docs/12.x/eloquent)

