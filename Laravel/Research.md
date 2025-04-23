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